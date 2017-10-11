require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/exec_container'

get '/' do
  slim :index
end

get '/exec' do
  r = ExecContainer.new(Time.now.to_f, 'c')
  r.exec.to_s
end

post '/api/run' do
  lang = params[:language]
  prog = params[:source_code]
  stdin = params[:input1]
  time = Time.now.to_f
  # プログラムファイル
  p_fname = "#{time}.#{lang.downcase}"
  # 標準入力ファイル
  i_fname = "#{time}.in"

  File.open("tmp/#{p_fname}", 'w') do |f|
    prog.split('\n').each do |l|
      f.puts(l)
    end
  end

  File.open("tmp/#{i_fname}", 'w') do |f|
    stdin.split('\n').each do |l|
      f.puts(l)
    end
  end

  c = ExecContainer.new(time, lang)
  r = c.exec()

  return_params = {stdout: r[0].join(''), stderr: r[1].join(''), exit_code: r[2]}
  content_type :json
  return_params.to_json
end

