assert(reaper.CF_GetClipboard, "SWS v2.9.5 or newer is required")

function open_url(url)
  local OS = reaper.GetOS()
  if OS == "OSX32" or OS == "OSX64" then
    os.execute('open "" "' .. url .. '"')
  else
    os.execute('start "" "' .. url .. '"')
  end
end

searchTerm = reaper.CF_GetClipboard('')

function mer_lookup(searchTerm)
	mer_url = "https://www.merriam-webster.com/dictionary/"
	searchUrl = mer_url.. searchTerm
	open_url(searchUrl)
end

function youglish_lookup(searchTerm)
	searchUrl = "https://youglish.com/pronounce/"..searchTerm.."/english/us"
	open_url(searchUrl)
end

function cambridge_lookup(searchTerm)
  cambridge_url = "https://dictionary.cambridge.org/us/dictionary/english/"
  searchUrl = cambridge_url.. searchTerm
  open_url(searchUrl)
end

cambridge_lookup(searchTerm)
youglish_lookup(searchTerm)
mer_lookup(searchTerm)