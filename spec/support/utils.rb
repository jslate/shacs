module Features
  module Utils
    def screenshot
      Dir.entries('tmp/').select {|f| f.match(/\.png$/) && File.stat("tmp/#{f}").mtime < Date.yesterday}.each {|f| File.delete("tmp/#{f}") }
      file = "tmp/#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}-#{rand}.png"
      save_screenshot(file)
      `open #{file}`
    end
  end
end