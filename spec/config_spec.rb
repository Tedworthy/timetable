require 'spec_helper'

describe Config do
  describe '#read' do
    context "given a valid YAML configuration file in the config path" do
      let(:config_path) { File.join(Config.path, "sushi.yml") }
      let(:config_data) { { "sushi" => %w[maki nigiri sashimi] } }

      before :all do
        File.open(config_path, 'w') do |f|
          YAML::dump(config_data, f)
        end
      end

      # Clean up after testing
      after :all do
        File.delete(config_path)
      end

      it "returns nil for an invalid configuration key" do
        Config.read("this_key_will_never_exist").should be_nil
      end

      it "returns the corresponding value for a valid key" do
        value = Config.read("sushi")
        value.should == YAML::parse(config_path)["sushi"]
      end
    end
  end
end