local pad = nil
function ReadControls()
	pad = Controls.read()
end

local crossPressed = false
function PressCross()
	if (not crossPressed and pad:cross()) then
		crossPressed = true
		return true
	else
		return false
	end
end

function ReleaseCross()
	if (crossPressed and not pad:cross())
	then
		crossPressed = false
		return true
	else
		return false
	end
end
