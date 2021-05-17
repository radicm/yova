class Settings
  def self.config
    Rails.application.config.settings
  end
end

path = Rails.root.join('config', 'settings.yml')
settings = YAML.load_file(path)

Rails.application.config.settings = JSON.parse(settings.to_json, object_class:OpenStruct)