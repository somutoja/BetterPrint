local BetterPrint = require('BetterPrint')

local function Test(msg)
    BetterPrint.print({type = 'success'}, msg)
end

Test('The BetterPrint library works!')