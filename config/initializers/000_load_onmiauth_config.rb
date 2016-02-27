file_path     = Rails.root.join 'config', 'omniauth_credentials.yml'
file_contents = File.read(file_path)
parsed_file   = ERB.new(file_contents).result
OmniauthConfig = YAML.load(parsed_file)[Rails.env]
