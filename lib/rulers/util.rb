module Rulers
  def self.to_underscore(string)
    string.gsub(/::/, '/').
      gsub(/(A-Z)+)([a-Z][a-z])/, '\1_\2').
      gsub(/[a-z\d]) ([A-z])/,'\1_2').
      tr("-", "_").
      downcase
  end
end
