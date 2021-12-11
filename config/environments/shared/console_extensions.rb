class String
  def yellow() = "\e[33m#{self}\e[0m"
  def cyan() = "\e[36m#{self}\e[0m"
  def red() = "\e[31m#{self}\e[0m"
  def green() = "\e[32m#{self}\e[0m"
  def magenta() = "\x1b[35m#{self}\e[0m"
  def dim() = "\x1b[2m#{self}\e[0m"
  def bold() = "\e[1m#{self}\e[22m"
  def to_console() = puts(self)
  def to_console_inline() = print(self)
end
