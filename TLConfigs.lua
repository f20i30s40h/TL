local TLConfigs = {}
function TLConfigs:LoadWindUI()
  return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua"))()
end
function TLConfigs:WindUIPopup(entrance, tt, CT, Btns)
  return entrance:Popup({Title = tt or "", Icon = "info", Content = CT or "", Buttons = Btns or {} })
end
function TLConfigs:SetupWindUI(entrance, name, author, img, theme, openname)
  entrance.TransparencyValue = 0
  local Window = entrance:CreateWindow({
    Title = name,
    Author = author,
    Icon = "solar:sun-2-bold",
    Theme = theme or "Violet",
    NewElements = true,
    Transparent = true,
    Acrylic = true,
    BackgroundImageTransparency = 0.45,
    Background = img,
    Size = UDim2.fromOffset(580, 460)
  })
  Window:EditOpenButton({
    Title = openname or "Open",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 32),
    StrokeThickness = 2,
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
  })
  return {
    Window = Window,
    AddTab = function(a, b)
      return Window:Tab({Title = a, Icon = b or "rbxassetid://77799629590713", IconThemed = true})
    end,
    Sec = function(tab, title, opened)
      return tab:Section({Title = title, Opened = opened or true})
    end,
    Btn = function(section, title, callback)
      return section:Button({Title = title, Callback = callback or function() end})
    end,
    Tg = function(section, title, value, callback)
      return section:Toggle({Title = title, Value = value or false, Callback = callback or function() end})
    end,
    Tb = function(section, title, inputType, callback)
      return section:Input({Title = title, InputIcon = "bird", Type = inputType or "Input",--[["Textarea"]] Placeholder = "请输入...", Callback = callback or function() end})
    end,
    Sld = function(section, title, min, max, value, step, callback)
      return section:Slider({Title = title, Value = {Min = min, Max = max, Default = value}, Step = step, Callback = callback or function() end})
    end,
    Para = function(section, title, desc)
      return section:Paragraph({Title = title, Desc = desc or ""})
    end,
    Dpd = function(section, title, values, value, multi, callback)
      return section:Dropdown({Title = title, Values = values or {}, Value = multi and {} or (value or (values and values[1])), Multi = multi or false, AllowNone = multi and true or nil, Callback = callback or function() end})
    end
  }
end
function TLConfigs:AddTag(entrance, tt, ic, cl)
  return entrance:Tag({Title = tt or "v1.0.0", Icon = ic or "github", Color = cl or Color3.fromHex("#30ff6a"), Radius = 13})
end
function TLConfigs:AddHigh(part, color, Ft, Ot, enabled)
  local hl = part:FindFirstChild("HL")
  if not hl then
    local HL = Instance.new("Highlight", part)
    HL.FillColor = color
    HL.OutlineColor = color
    HL.FillTransparency = Ft
    HL.OutlineTransparency = Ot
    HL.Enabled = enabled
   else
    local HL = hl
    HL.FillColor = color
    HL.OutlineColor = color
    HL.FillTransparency = Ft
    HL.OutlineTransparency = Ot
    HL.Enabled = enabled
  end
end
function TLConfigs:AddBill(part, color, text, enabled, ts, ttf)
  local bg = part:FindFirstChild("BG")
  if not bg then
    local BG = Instance.new("BillboardGui", workspace)
    BG.Name = "BG"
    BG.AlwaysOnTop = true
    BG.Size = UDim2.new(0, 100, 0, 50)
    BG.StudsOffset = Vector3.new(0, 1.4, 0)
    BG.Enabled = enabled
    local TL = Instance.new("TextLabel", BG)
    TL.BackgroundTransparency = 1
    TL.Size = UDim2.new(0, 100, 0, 50)
    TL.FontFace = Font.fromId(ttf or 12187376739)
    TL.Text = text
    TL.TextSize = ts or 15
    TL.TextColor3 = color
    TL.Parent = BG
    BG.Parent = part
    if not enabled then
      TL.Text = ""
    end
   else
    local BG = bg
    local TL = BG:FindFirstChild("TextLabel")
    TL.Text = text
    TL.TextColor3 = color
    BG.Enabled = enabled
    if not enabled then
      TL.Text = ""
    end
  end
end
function TLConfigs:AddESP(part, color, text, enabled, ts, ttf)
  local hl = part:FindFirstChild("HL")
  local bg = part:FindFirstChild("BG")
  if not hl then
    local HL = Instance.new("Highlight", part)
    HL.Name = "HL"
    HL.FillColor = color
    HL.Enabled = enabled
   else
    local HL = hl
    HL.Enabled = enabled
    HL.FillColor = color
  end
  if not bg then
    local BG = Instance.new("BillboardGui", workspace)
    BG.Name = "BG"
    BG.AlwaysOnTop = true
    BG.Size = UDim2.new(0, 100, 0, 50)
    BG.StudsOffset = Vector3.new(0, 1.4, 0)
    BG.Enabled = enabled
    local TL = Instance.new("TextLabel", BG)
    TL.BackgroundTransparency = 1
    TL.Size = UDim2.new(0, 100, 0, 50)
    TL.FontFace = Font.fromId(ttf or 12187376739)
    TL.Text = text
    TL.TextSize = ts or 15
    TL.TextColor3 = color
    TL.Parent = BG
    BG.Parent = part
    if not enabled then
      TL.Text = ""
    end
   else
    local BG = bg
    local TL = BG:FindFirstChild("TextLabel")
    TL.Text = text
    TL.TextColor3 = color
    BG.Enabled = enabled
    if not enabled then
      TL.Text = ""
    end
  end
end
function TLConfigs:ESP(Thing, color, text, Num, OnOff)
  if not Thing:FindFirstChild("Highlight") then
    local HL = Instance.new("Highlight", Thing)
    HL.FillColor = color
    HL.Enabled = OnOff
   else
    Thing.Highlight.Enabled = OnOff
  end
  if not Thing:FindFirstChild("BillboardGui") then
    local BG = Instance.new("BillboardGui", Thing)
    BG.AlwaysOnTop = true
    BG.Size = UDim2.new(0, 100, 0, 50)
    BG.StudsOffset = Vector3.new(0, Num, 0)
    BG.Enabled = OnOff
    local TL = Instance.new("TextLabel", BG)
    TL.Text = text
    TL.BackgroundTransparency = 1
    TL.Size = UDim2.new(0, 100, 0, 50)
    TL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TL.TextWrapped = true
   else
    Thing.BillboardGui.Enabled = OnOff
  end
end
function TLConfigs:Loop(mode, callback)
  return game["Run Service"][({
    ["Stepped"] = "Stepped",
    ["PreRender"] = "PreRender",
    ["PostRender"] = "PostRender",
    ["RenderStepped"] = "RenderStepped",
    ["Heartbeat"] = "Heartbeat",
    ["PreSimulation"] = "PreSimulation",
    ["PostSimulation"] = "PostSimulation",
    ["PreAnimation"] = "PreAnimation",
    ["PhysicsStepped"] = "PhysicsStepped"
  })[mode]]:Connect(callback)
end
return TLConfigs
