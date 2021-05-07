require 'pry'
PI = Math::PI
R = 22.2
L = 0.149
F = 50
OMEGA = 2*PI*50
DELTA = 0.001
PHI = Math.atan((OMEGA*L)/R)

def method1(angle)
    b1 = PI
    b2 = 2*PI
    bm = 0
    rad = (angle * PI)/180

    y = Math.sin(PI-PHI)-Math.exp(-((PI-rad)*R)/(OMEGA*L))*Math.sin(rad-PHI)
    while (b1-b2).abs > DELTA do
        bm = (b1 + b2)/2
        ym = Math.sin(bm-PHI)-Math.exp(-((bm-rad)*R)/(OMEGA*L))*Math.sin(rad-PHI)
        if (y*ym) > 0
            b1 = bm
        else
            b2 = bm
        end
    end
    return (bm*180)/PI
end

for angle in [0,18,36,54,72,90,108,126,144,162,180] do
    p "制御角α=#{sprintf("%d", angle)}[deg]の時、消弧角β=#{sprintf("%.1f",method1(angle))}[deg]"
end
