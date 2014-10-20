#!/usr/bin/env ruby

Dir.chdir ENV['HOME']

resources = {
  'bundle' => {
    'ack.vim'           => 'git://github.com/mileszs/ack.vim.git',
    'nerdcommenter'     => 'git://github.com/scrooloose/nerdcommenter.git',
    'nerdtree'          => 'git://github.com/scrooloose/nerdtree.git',
    'vim-abolish'       => 'git://github.com/tpope/vim-abolish.git',
    'vim-comments'      => 'git://github.com/h13ronim/vim-comments.git',
    'vim-cucumber'      => 'git://github.com/tpope/vim-cucumber.git',
    'vim-endwise'       => 'git://github.com/tpope/vim-endwise.git',
    'vim-fugitive'      => 'git://github.com/tpope/vim-fugitive.git',
    'vim-haml'          => 'git://github.com/tpope/vim-haml.git',
    'vim-markdown'      => 'http://github.com/tpope/vim-markdown.git',
    'vim-rails'         => 'http://github.com/tpope/vim-rails.git',
    'vim-rake'          => 'http://github.com/tpope/vim-rake.git',
    'vim-repeat'        => 'git://github.com/tpope/vim-repeat.git',
    'vim-surround'      => 'git://github.com/tpope/vim-surround.git',
    'vim-unimpaired'    => 'git://github.com/tpope/vim-unimpaired.git',
    'vim-vividchalk'    => 'git://github.com/tpope/vim-vividchalk.git',
    'tabular'           => 'https://github.com/godlygeek/tabular.git',
    'rvm.vim'           => 'http://github.com/csexton/rvm.vim',
    'vim-less'          => 'https://github.com/groenewege/vim-less',
    'apidock.vim'       => 'https://github.com/mileszs/apidock.vim',
    'vim-coffee-script' => 'https://github.com/kchmck/vim-coffee-script.git'
  },
  'misc' => {
    'vim-pathogen'   => 'http://github.com/tpope/vim-pathogen.git'
  }
}

Dir.mkdir('.vim') unless File.directory?('.vim')
Dir.chdir('.vim')

resources.each do |resource,parts|
  Dir.mkdir(resource) unless File.directory?(resource)
  Dir.chdir(resource)

  parts.each do |bundle_name, repository|
    puts
    puts "#{bundle_name} (#{repository})"
    if File.directory?(bundle_name)
      Dir.chdir(bundle_name)
      system("git pull")
      Dir.chdir('..')
    else
      system("git clone #{repository} #{bundle_name}")
    end
  end
  Dir.chdir('..')
end

Dir.mkdir('autoload') unless File.directory?('autoload')
Dir.chdir('autoload')
begin
  File.delete('pathogen.vim')
rescue
end
File.symlink('../misc/vim-pathogen/autoload/pathogen.vim', 'pathogen.vim')

