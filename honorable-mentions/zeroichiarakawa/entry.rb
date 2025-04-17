def destiny = yield

def forever_love?
  love = true
  destiny do
    begin
      begin
        redo
      ensure
      end
    ensure
      love = !love
      break
    end
  end
  love
end

p forever_love?
