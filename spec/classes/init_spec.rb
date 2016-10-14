require 'spec_helper'

describe "macloginhook", :type => 'class' do

  context "when passed no params" do
    it { should_not contain_macloginhook__hook('login') }
  end

  context "when enable == true" do

    context "when $scripts is undefined" do
      let(:params) do
        { :enable => true }
      end
      it { should raise_error(Puppet::Error, /not an absolute path/) }
    end

    context "when scripts is defined" do
      the_scripts = '/Library/Loginhooks'
      let(:params) do
        { :enable => true, :scripts => the_scripts }
      end
      it { should contain_macloginhook__hook('login').with(
        'enable'  => true,
        'scripts' => the_scripts,
      )}
    end

  end

  context "when enable == false" do
    let(:params) do
      { :enable => false }
    end
    it { should contain_macloginhook__hook('login').with(
      'enable'  => false,
      'scripts' => nil,
    )}
  end

end