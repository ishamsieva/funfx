namespace :generate do
  {
    :code          => 'lib/funfx/flex/elements.rb',
    :class_dot     => 'website/funfx.dot'
  }.each do |generated, file|
    desc "Generate #{generated}"
    task generated do
      require 'funfx/meta/generator'
      parser = FunFX::Meta::Parser.new
      generator = FunFX::Meta::Generator.new(parser, generated)
      generated = generator.generate
      File.open(file, 'wb') {|io| io.write generated}
    end
  end
  
  desc "Generate class diagram"
  task :class_diagram => :class_dot do
    sh "dot -T pdf -o website/funfx.pdf website/funfx.dot"
  end
end