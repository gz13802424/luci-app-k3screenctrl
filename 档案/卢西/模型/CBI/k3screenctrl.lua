-- Copyright (C) 2018 XiaoShan mivm.cn

local m, s ,o

m = Map("k3screenctrl", translate("Screen"), translate("Customize your device screen"))

s = m:section(TypedSection, "general", translate("General Setting") )
s.anonymous = true

o = s:option(ListValue, "screen_time", translate("Screen time :"), translate("This time no action, the screen will close."))
o:value("10",translate("10 s"))
o:value("30",translate("30 s"))
o:value("60",translate("60 s"))
o:value("300",translate("5 m"))
o:value("600",translate("10 m"))
o:value("900",translate("15 m"))
o:value("1800",translate("30 m"))
o:value("3600",translate("60 m"))
o.default = 10
o.rmempty = false

o = s:option(ListValue, "refresh_time", translate("Refresh interval :"), translate("Screen data refresh interval."))
o:value("1",translate("1 s"))
o:value("2",translate("2 s"))
o:value("5",translate("5 s"))
o:value("10",translate("10 s"))
o.default = 2
o.rmempty = false

o = s:option(Flag, "city_checkip", translate("check city from ip :"), translate("check city from local ip"))
o.default = 0

o = s:option(Value, "city", translate("city :"), translate("please input right city name"))
o:value("WX4FBXXFKE4F",translate("北京市"))
o:value("WS0E9D8WN298",translate("广东省/广州市"))
o:value("WS0E8F6N4RPM",translate("广东省/广州市/荔湾区"))
o:value("WS0E96FT02NG",translate("广东省/广州市/越秀区"))
o:value("WS0E66Z20TDM",translate("广东省/广州市/海珠区"))
o:value("WS0EE6PJG2NP",translate("广东省/广州市/天河区"))
o:value("WS0EC2PHQX3N",translate("广东省/广州市/白云区"))
o:value("WS0EMWYGT1DG",translate("广东省/广州市/黄埔区"))
o:value("WS0DE3FVQQJF",translate("广东省/广州市/番禺区"))
o:value("WS0T07U6CHNV",translate("广东省/广州市/花都区"))
o:value("WS09XPQTZJDF",translate("广东省/广州市/南沙区"))
o:value("WS0VBX4KTY4M",translate("广东省/广州市/从化区"))
o:value("WS0UW38KR4ZC",translate("广东省/广州市/增城区"))
o:value("WS2V1N2FZZ77",translate("广东省/韶关市"))
o:value("WS10730EM8EV",translate("广东省/深圳市"))
o:value("WEBY8Q5HHUCU",translate("广东省/珠海市"))
o:value("WS4UZ4EZ953Z",translate("广东省/汕头市"))
o:value("WS06YNEMPP18",translate("广东省/佛山市"))
o:value("WS02MNW64CP6",translate("广东省/江门市"))
o:value("W7Y3P046TR7U",translate("广东省/湛江市"))
o:value("W7YGK0CKZKF9",translate("广东省/茂名市"))
o:value("WKPGPK45UZQM",translate("广东省/肇庆市"))
o:value("WS17E8Y5G0RU",translate("广东省/惠州市"))
o:value("WS6D4KH12059",translate("广东省/梅州市"))
o:value("WS4196CZ5GG1",translate("广东省/汕尾市/城区"))
o:value("WS1WFPCVR8WG",translate("广东省/河源市"))
o:value("W7ZSKJM3GP7Z",translate("广东省/阳江市"))
o:value("WS0QU43YTBHW",translate("广东省/清远市"))
o:value("WS0GHKN5ZP7T",translate("广东省/东莞市"))
o:value("WS08H58U92R8",translate("广东省/中山市"))
o:value("WEEJ79ZFGR3H",translate("广东省/东沙群岛"))
o:value("WS4YTUBPDZY9",translate("广东省/潮州市"))
o:value("WKPDMK3Y8JWT",translate("广东省/云浮市"))
o.default = 2
o.rmempty = true
--o.rmempty = false

o = s:option(Value, "key", translate("key :"), translate("please input private key(https://www.seniverse.com/)"))

o = s:option(ListValue, "update_time", translate("weather update_time :"))
o:value("3600",translate("1h"))
o:value("14400",translate("4h"))
o:value("43200",translate("12h"))
o.default = 3600
o.rmempty = false

o = s:option(Flag, "psk_hide", translate("Hide Wireless password"))
o.default = 0

o = s:option(Flag, "showmore", translate("Display More Info"), translate("The first page shows more information including: CPU temprature, Load, RAM, uptime, etc"))
o.default = 0

o = s:option(Button,"test_print",translate("Test"),translate("Execute k3screenctrl -t and return the result"))
o.inputtitle = translate("Print info")
o.write = function()
	luci.sys.call("k3screenctrl -t > /tmp/k3screenctrl/test")
	luci.http.redirect(luci.dispatcher.build_url("admin","system","k3screenctrl"))
end

s = m:section(TypedSection, "device_custom", translate("Device customization") ,translate("Customize the fifth page of device information"))
s.template = "cbi/tblsection"
s.addremove = true
s.anonymous = true

o = s:option(Value,"mac",translate("Device"))
o.datatype = "macaddr"
o.rmempty = false
luci.sys.net.mac_hints(function(t,a)
	o:value(t,"%s (%s)"%{a,t})
end)

o = s:option(Value,"name",translate("Hostname"))
o.rmempty = false

o = s:option(ListValue,"icon",translate("Icon"))
o.rmempty = false
o:value("0",translate("Auto"))
o:value("1",translate("OnePlus"))
o:value("2","360")
o:value("3",translate("Asus"))
o:value("4",translate("Coolpad"))
o:value("5",translate("Dell"))
o:value("6",translate("Haier"))
o:value("7",translate("Hasee"))
o:value("8",translate("Honor"))
o:value("9",translate("HP"))
o:value("10","HTC")
o:value("11",translate("Huawei"))
o:value("12",translate("Apple"))
o:value("13",translate("Lenovo"))
o:value("14",translate("LeEco"))
o:value("15","LG")
o:value("16",translate("Meitu"))
o:value("17",translate("Meizu"))
o:value("18","OPPO")
o:value("19",translate("Phicomm"))
o:value("20",translate("Samsung"))
o:value("21",translate("Smartisan"))
o:value("22",translate("Sony"))
o:value("23","TCL")
o:value("24","ThinkPad")
o:value("25",translate("TongfangPC"))
o:value("26","VIVO")
o:value("27",translate("Microsoft"))
o:value("28",translate("XiaoMi"))
o:value("29",translate("ZTE"))

if nixio.fs.access("/tmp/k3screenctrl/test") then
	s = m:section(TypedSection, "general", translate("Output results"))
	s.anonymous = true
	o = s:option(TextValue,"test_output_results")
	o.readonly = true
	o.rows = 30
	o.cfgvalue = function()
		return luci.sys.exec("cat /tmp/k3screenctrl/test && rm -f /tmp/k3screenctrl/test")
	end
end

return m
