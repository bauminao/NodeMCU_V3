wire1 = 8
wire2 = 7
wire3 = 6
wire4 = 5

_delay = 2000 --delay in between two steps. minimum delay more the rotational speed

gpio.mode(wire1, gpio.OUTPUT)--set four wires as output
gpio.mode(wire2, gpio.OUTPUT)
gpio.mode(wire3, gpio.OUTPUT)
gpio.mode(wire4, gpio.OUTPUT)

function sequence(a, b, c, d)--four step sequence to stepper motor
    gpio.write(wire1, a)
    gpio.write(wire2, b)
    gpio.write(wire3, c)
    gpio.write(wire4, d)
    tmr.delay(_delay)
end

while true do
    for i = 1 ,12 do --Rotation in one direction
        sequence(gpio.HIGH, gpio.LOW, gpio.LOW, gpio.LOW)
        sequence(gpio.HIGH, gpio.HIGH, gpio.LOW, gpio.LOW)
        sequence(gpio.LOW, gpio.HIGH, gpio.LOW, gpio.LOW)
        sequence(gpio.LOW, gpio.HIGH, gpio.HIGH, gpio.LOW)
        sequence(gpio.LOW, gpio.LOW, gpio.HIGH, gpio.LOW)
        sequence(gpio.LOW, gpio.LOW, gpio.HIGH, gpio.HIGH)
        sequence(gpio.LOW, gpio.LOW, gpio.LOW, gpio.HIGH)
        sequence(gpio.HIGH, gpio.LOW, gpio.LOW, gpio.HIGH)
    end
    sequence(gpio.HIGH, gpio.LOW, gpio.LOW, gpio.LOW)
    --[[--
    for i = 1 ,12 do --Rotation in opposite direction
        sequence(gpio.LOW, gpio.LOW, gpio.LOW, gpio.HIGH)
        sequence(gpio.LOW, gpio.LOW, gpio.HIGH, gpio.HIGH)
        sequence(gpio.LOW, gpio.LOW, gpio.HIGH, gpio.LOW)
        sequence(gpio.LOW, gpio.HIGH, gpio.HIGH, gpio.LOW)
        sequence(gpio.LOW, gpio.HIGH, gpio.LOW, gpio.LOW)
        sequence(gpio.HIGH, gpio.HIGH, gpio.LOW, gpio.LOW)
        sequence(gpio.HIGH, gpio.LOW, gpio.LOW, gpio.LOW)
        sequence(gpio.HIGH, gpio.LOW, gpio.LOW, gpio.HIGH)
    end
    sequence(gpio.LOW, gpio.LOW, gpio.LOW, gpio.HIGH)
    ]]
end 