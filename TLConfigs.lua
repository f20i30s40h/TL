local TLConfigs = {}
function TLConfigs:LoadWindUI()
  return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua"))()
end
function TLConfigs:WindUIPopup(entrance, tt, CT, Btns)
  return entrance:Popup({Title = tt or "", Icon = "info", Content = CT or "", Buttons = Btns or {} })
end
function TLConfigs:SetupWindUI(entrance, name, author, folder, img, theme, openname, size, transparency, rainbow)
  entrance.TransparencyValue = 0
  local Window = entrance:CreateWindow({
    Title = name,
    Author = author,
    Folder = folder,
    Icon = "solar:sun-2-bold",
    Theme = theme or "Violet",
    NewElements = true,
    Transparent = true,
    Acrylic = true,
    BackgroundImageTransparency = 0.45,
    Background = img,
    Size = size or UDim2.fromOffset(580, 460),
    BackgroundTransparency = transparency or 0.4
  })
  Window:EditOpenButton({
    Title = openname or "Open",
    Icon = "gem",--monitor
    CornerRadius = UDim.new(0, 32),
    StrokeThickness = 2,
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
    Color = rainbow and ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))}) or nil
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
    end,
    Cp = function(section, title, def, callback)
      return section:Colorpicker({Title = title, Default = def, Callback = callback})
    end,
  }
end
function TLConfigs:Notify(entrance, tt, ct, dr)
  return entrance:Notify({Title = tt, Content = ct, Duration = dr})
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
function TLConfigs:Export(wd)
  local env = getfenv(2)
  local methods = {"AddTab", "Sec", "Btn", "Tg", "Tb", "Sld", "Para", "Dpd", "Cp"}
  for _, method in ipairs(methods) do
    env[method] = wd[method]
  end
end
function TLConfigs:AddStroke(s_theme)
  local COLORS = {
  ["暗紫色"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("2E1065")), ColorSequenceKeypoint.new(0.3, Color3.fromHex("4C1D95")), ColorSequenceKeypoint.new(0.6, Color3.fromHex("7C3AED")), ColorSequenceKeypoint.new(1, Color3.fromHex("C084FC"))}),
  ["彩色"] = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromHex("FF0000")), ColorSequenceKeypoint.new(0.17, Color3.fromHex("FF7F00")), ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")), ColorSequenceKeypoint.new(0.50, Color3.fromHex("00FF00")), ColorSequenceKeypoint.new(0.67, Color3.fromHex("00FFFF")), ColorSequenceKeypoint.new(0.83, Color3.fromHex("0000FF")), ColorSequenceKeypoint.new(1.00, Color3.fromHex("8B00FF"))}),
  ["霓虹"] = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromHex("FF00FF")), ColorSequenceKeypoint.new(0.33, Color3.fromHex("A855F7")), ColorSequenceKeypoint.new(0.66, Color3.fromHex("00FFFF")), ColorSequenceKeypoint.new(1.00, Color3.fromHex("FF00FF"))}),
  ["赛博"] = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromHex("00C6FF")), ColorSequenceKeypoint.new(0.30, Color3.fromHex("7C3AED")), ColorSequenceKeypoint.new(0.60, Color3.fromHex("FF2FD0")), ColorSequenceKeypoint.new(0.85, Color3.fromHex("FF8A00")), ColorSequenceKeypoint.new(1.00, Color3.fromHex("00C6FF"))}),
  ["极光"] = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromHex("00FFB2")), ColorSequenceKeypoint.new(0.25, Color3.fromHex("00C6FF")), ColorSequenceKeypoint.new(0.50, Color3.fromHex("8B5CF6")), ColorSequenceKeypoint.new(0.75, Color3.fromHex("FF4FD8")), ColorSequenceKeypoint.new(1.00, Color3.fromHex("00FFB2"))}),
  ["火焰"] = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.fromHex("FF1E00")), ColorSequenceKeypoint.new(0.33, Color3.fromHex("FF7A00")), ColorSequenceKeypoint.new(0.66, Color3.fromHex("FFD400")), ColorSequenceKeypoint.new(1.00, Color3.fromHex("FF1E00"))})
}
local borderAnimation
local animationSpeed = 5
local function createRainbowBorder(window, colorScheme)
  local mainFrame = window.UIElements.Main
  if not mainFrame then return nil end
  local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
  if existingStroke then existingStroke:Destroy() end
  if not mainFrame:FindFirstChildOfClass("UICorner") then
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = mainFrame
  end
  local rainbowStroke = Instance.new("UIStroke")
  rainbowStroke.Name = "RainbowStroke"
  rainbowStroke.Thickness = 1.5
  rainbowStroke.Transparency = 0.15
  rainbowStroke.Color = Color3.new(1, 1, 1)
  rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
  rainbowStroke.Parent = mainFrame
  local glowEffect = Instance.new("UIGradient")
  glowEffect.Name = "GlowEffect"
  glowEffect.Color = COLORS[colorScheme]
  glowEffect.Rotation = 0
  glowEffect.Parent = rainbowStroke
  local outerGlow = Instance.new("UIStroke")
  outerGlow.Name = "OuterGlow"
  outerGlow.Thickness = 8
  outerGlow.Transparency = 0.85
  outerGlow.Color = Color3.fromHex("7C3AED")
  outerGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  outerGlow.Parent = mainFrame
  return rainbowStroke
end
local function startBorderAnimation(window, speed)
  local mainFrame = window.UIElements.Main
  if not mainFrame then return nil end
  local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
  if not rainbowStroke then return nil end
  local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
  if not glowEffect then return nil end
  return game:GetService("RunService").Heartbeat:Connect(function()
    if not rainbowStroke or rainbowStroke.Parent == nil then return end
    glowEffect.Rotation = (tick() * speed * 10) % 360
  end)
end
local rainbowStroke = createRainbowBorder(Window, s_theme)
if rainbowStroke then
  borderAnimation = startBorderAnimation(Window, animationSpeed)
end


end
return TLConfigs
