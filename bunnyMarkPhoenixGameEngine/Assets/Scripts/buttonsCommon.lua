function press(button)
	return buttons.pressed(buttons[button])
end

function held(button)
	return buttons.held(buttons[button])
end

function release(button)
	return buttons.released(buttons[button])
end
