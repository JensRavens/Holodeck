Pod::Spec.new do |s|
  s.name = "Holodeck"
  s.version = "0.0.1"
  s.license = "MIT"
  s.summary = "Cocoa Bindings for Interstellar."
  s.homepage = "https://github.com/JensRavens/Holodeck"
  s.social_media_url = "http://twitter.com/JensRavens"
  s.authors = { "Jens Ravens" => "jens@nerdgeschoss.de" }
  s.source = { git: "https://github.com/JensRavens/Holodeck.git", tag: s.version }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source_files = "Holodeck/**/*.swift"

  s.requires_arc = true
end
