local melon = {}
melon = gg.makeRequest("https://raw.githubusercontent.com/SimpleCodeStudio/My-Public-Values/refs/heads/main/scbi_x64_data.lua")
if not melon or not melon.content then print("Data Can't get!") return end
local httpData = {}
setmetatable(httpData, { __index = _G })
local getMelon, badMelon = load(melon.content, "RemoteScript", "t", httpData)
if not getMelon then print("Lua code can't loaded: ", badMelon) return end
local success, result = pcall(getMelon)
if not success then print("Code can't worked: ", result) return end

function valueNotFound() gg.alert("Searched value not found. Please ask this from developer. (SimpleCodeStudio)") return end
function Refine(a) gg.refineNumber(a) end
function Search(d,r) gg.clearResults(); gg.searchNumber(d, r); if gg.getResultsCount() == 0 then valueNotFound() end end
function Offset(of) local o={}; gr=gg.getResults("1"); o[1]={}; o[1].address=gr[1].address+of; o[1].flags=gg.TYPE_DWORD; gg.addListItems(o) end


gg.clearList()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
Search("53;4;19;49;38::76",gg.TYPE_DWORD)
gg.refineNumber("53")
Offset(httpData.wrcOfsets[1])
gg.sleep("100")
warP = gg.getListItems("1")[1].value
warPt = true
Search(warP,gg.TYPE_DWORD)
gg.sleep("100")
gg.clearList()
g9 = gg.getResults("30")
for i, v in ipairs(g9) do
  v.address = v.address + httpData.wrcOfsets[2]
  if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
end
gg.addListItems(g9)
gg.sleep("100")
g10 = gg.getResults("30")
for i, v in ipairs(g10) do
  v.address = v.address + httpData.wrcOfsets[3]
  if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
end
gg.addListItems(g10)
gg.sleep("100")
g11 = gg.getResults("30")
for i, v in ipairs(g11) do
  v.address = v.address + httpData.wrcOfsets[4]
  if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
end
gg.sleep("100")
gg.addListItems(g11)
l2 = gg.getListItems("280")
gg.loadResults(l2)
gg.getResults("280")
if bit32 == true then gg.editAll("0",gg.TYPE_DWORD) else gg.editAll("0",gg.TYPE_QWORD) end
gg.clearResults()
gg.clearList()
print("Successfuly")
