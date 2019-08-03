# # encoding: utf-8

# Inspec test for recipe install-py-rb-go::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Check command
RSpec.shared_context 'check_command' do
	its('stderr') { should eq '' }
	its('exit_status') { should eq 0 }
end

# check directory
ghq_root = "#{ENV['HOME']}/.ghq"
ghq_list = [
	"github.com/CircleCI-Public/circleci-demo-ios", 
	"github.com/Phidica/sublime-fish", 
	"github.com/Yusuke-Shimizu/ansible-role-get-repositories", 
	"github.com/Yusuke-Shimizu/ansible-role-set-fish", 
	"github.com/Yusuke-Shimizu/ansible-role-setup-mac", 
	"github.com/Yusuke-Shimizu/ansible_role_VirtualBox_Extension-Pack", 
	"github.com/Yusuke-Shimizu/ansible_role_asdf_on_mac", 
	"github.com/Yusuke-Shimizu/ansible-role-template",
	"github.com/Yusuke-Shimizu/aws-cloud9-codecommit", 
	"github.com/Yusuke-Shimizu/circleci-test", 
	"github.com/Yusuke-Shimizu/install-py-rb-go-cookbook", 
	"github.com/Yusuke-Shimizu/install-rb-py-go-on-asdf", 
	"github.com/Yusuke-Shimizu/osx-circleci-chef", 
	"github.com/Yusuke-Shimizu/prometheus-test", 
	"github.com/Yusuke-Shimizu/travisci-test", 
	"github.com/Yusuke-Shimizu/mac-dev-playbook",
	"github.com/asdf-chef/asdf", 
	"github.com/asdf-vm/asdf", 
	"github.com/cimon-io/ansible-role-asdf", 
	"github.com/dracula/iterm", 
	"github.com/dracula/sublime", 
	"github.com/geerlingguy/ansible-role-homebrew", 
	"github.com/geerlingguy/ansible-role-mas", 
	"github.com/geerlingguy/dotfiles", 
	"github.com/geerlingguy/mac-dev-playbook", 
	"github.com/sous-chefs/SublimeChef",
	"github.com/horike37/lambda-unittest-sample",
	"github.com/sous-chefs/SublimeChef", 
	"github.com/kenzo0107/vagrant-docker"
]
ghq_list.each{|repository_name|
	full_repo_path = "#{ghq_root}/#{repository_name}"
	describe file("#{full_repo_path}") do
		its('type') { should eq :directory }
	end

	# check latest version
	describe bash("cd #{full_repo_path} && git remote show origin") do
		include_context 'check_command'
		its('stdout') { should_not match (/local out of date/) }
	end
}

