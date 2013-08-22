json.array!(@qanotes) do |qanote|
  json.extract! qanote, :clientdetail, :productname, :projectname, :currenttag, :oldtag, :servername, :date, :developername, :gatekeeper, :uploadedfromtag, :tasknodetail, :patchnamedetail, :diff1, :diff2, :signature, :testedby
  json.url qanote_url(qanote, format: :json)
end
