# frozen_string_literal: true

module SupportTools
    class Facelift
      def facelift_object(obj, relations = false, ordered = false)
        ActiveRecord::Base.logger.silence do
          if obj.respond_to? :each
            count = obj.size
            limit = 0
            if count > 20
              "There are a lot of records to show (#{obj.size}).".to_console
              "Limit record output to how many? (just press return to ignore)".to_console
              limit = gets.strip.to_i
            end
            obj.each_with_index do |member, index|
              break unless limit.zero? || ((index + 1) <= limit)
  
              do_object(member, relations, ordered)
            end
          else
            do_object(obj, relations, ordered)
          end
        end
  
        nil
      end
  
      def do_table(fields, records)
        return "Invalid fields".red.to_console unless fields.respond_to? :each
  
        ActiveRecord::Base.logger.silence do
          records = [records] unless records.respond_to? :each
          widths = fields.map(&:length)
          fields.each_with_index do |field, index|
            records.each do |record|
              widths[index] = [widths[index], rval(record, field).to_s.length].max
            end
          end
  
          separator(0, widths)
          line(fields.map.with_index do |field, index|
            field.to_s.ljust(widths[index], " ")
          end)
          separator(1, widths)
          records.each do |record|
            line(fields.map.with_index do |field, index|
              rval(record, field).to_s.ljust(widths[index], " ")
            end)
          end
          separator(2, widths)
        end
        " Record count: #{records.count.to_s.bold}".to_console
      end
  
      private
  
      def rval(record, field)
        chain = field.to_s.split(".").map(&:to_sym)
        value_chain = [record] + Array.new(chain.size)
  
        chain.each_with_index do |attribute, index|
          base = value_chain[index]
          break if base.nil?
  
          value_chain[index + 1] = if base.respond_to? attribute
                                     base.send(attribute)
                                   else
                                     base[attribute] || base[attribute.to_s]
                                   end
        end
  
        value_chain.last.nil? ? "< nil >" : value_chain.last
      end
  
      def separator(set, widths)
        left = ["┏", "┣", "┗"]
        mid = ["┳", "╋", "┻"]
        right = ["┓", "┫", "┛"]
        fields = widths.map { |wdt| "━" * wdt }
        "#{left[set]}━#{fields.join("━#{mid[set]}━")}━#{right[set]}".to_console
      end
  
      def line(content)
        line = "┃ * ┃"
        line.gsub("*", content.join(" ┃ ")).to_console
      end
  
      def colorize_value(v)
        return v.to_s.cyan if [Integer, Float].include? v.class
        return v.to_s.green if [TrueClass, FalseClass].include? v.class
        return "\"#{v}\"".yellow if [String].include? v.class
        return v.to_s.yellow if [Symbol].include? v.class
        return v.to_s.magenta if [Hash, Array].include? v.class
        return "nil".dim if v.nil?
  
        v.to_s
      end
  
      def do_object(obj, relations, ordered)
        return colorize_value(nil) if obj.nil?
  
        if obj.respond_to? :attributes
          "\n#{obj}".yellow.to_console
  
          attribute_keys = obj.attributes.keys
          attribute_keys.sort! if ordered
          attribute_keys.each do |k|
            "  #{k.red} => #{colorize_value(obj.send(k))}".to_console
          end
  
          if relations && obj.class.respond_to?(:reflect_on_all_associations)
            association_names = obj.class.reflect_on_all_associations.map(&:name)
            association_names.sort! if ordered
            association_names.each do |r|
              assoc_count = begin
                ao = obj.send(r)
                " [#{ao.count}]".green if ao.respond_to?(:count)
              rescue SystemStackError
                " [?]".red
              end
              "#{"  > #{r}".cyan}#{assoc_count}".to_console
            end
          end
        else
          ("<#{obj.class.name}> ".yellow + colorize_value(obj)).to_console
        end
        nil
      end
    end
  end
  