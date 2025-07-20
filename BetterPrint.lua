local BetterPrint = {}

local ansiColors = {
    red = '\27[31m',
    redbg = '\27[1;37;41m',
    green = '\27[32m',
    greenbg = '\27[1;37;42m',
    blue = '\27[34m',
    bluebg = '\27[1;37;44m',
    yellow = '\27[33m',
    yellowbg = '\27[1;37;43m',
    purple = '\27[35m',
    white = '\27[37m',
    black = '\27[30m',
    cyan = '\27[36m',
    bold = '\27[1m',
    reset = '\27[0m'
}

function BetterPrint.Colorize(color, text)
    return ansiColors[color]..text..ansiColors.reset
end

function BetterPrint.ColorizeBold(color, text)
    return ansiColors.bold..ansiColors[color]..text..ansiColors.reset
end

function BetterPrint.AnsiReset()
    return ansiColors.reset
end

function BetterPrint.normalPrint(...)
    print(...) -- honestly, i don't even know why i made it, probably for the sake of making everything a part of the library
end

function BetterPrint.print(options, ...)
    if options.type == 'error' then
        BetterPrint.normalPrint(BetterPrint.Colorize('redbg', 'ERROR:'..BetterPrint.AnsiReset().. ansiColors.red.. ' '.. ...))
    end
    if options.type == 'warning' then
        BetterPrint.normalPrint(BetterPrint.ColorizeBold('yellowbg', 'WARNING:'..BetterPrint.AnsiReset().. ansiColors.yellow.. ' '.. ...))
    end
    if options.type == 'info' then
        BetterPrint.normalPrint(BetterPrint.ColorizeBold('bluebg', 'INFO:'..BetterPrint.AnsiReset().. ansiColors.blue.. ' '.. ...))
    end
    if options.type == 'success' then
        BetterPrint.normalPrint(BetterPrint.ColorizeBold('greenbg', 'SUCCESS:'..BetterPrint.AnsiReset().. ansiColors.green.. ' '.. ...))
    end
end

function BetterPrint.Showcase(text)
    if not text then
        text = 'The script works!'
    end
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('white', 'Printing normal text using BetterPrint.normalPrint():'))
    BetterPrint.normalPrint(text)
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('white', 'Printing colored text using BetterPrint.Colorize():'))
    BetterPrint.normalPrint(BetterPrint.Colorize('cyan', text))
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('white', 'Printing colored bold text using BetterPrint.ColorizeBold():'))
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('black', text))
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('white', 'Resetting the text using BetterPrint.AnsiReset():'))
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('purple', text..BetterPrint.AnsiReset()..' not colored text'))
    BetterPrint.normalPrint(BetterPrint.ColorizeBold('white', 'Printing with bold letters, white letters and a background for each type of debug message using BetterPrint.print():'))
    BetterPrint.print({type = 'error'}, text)
    BetterPrint.print({type = 'warning'}, text)
    BetterPrint.print({type = 'info'}, text)
    BetterPrint.print({type = 'success'}, text)
end

-- BetterPrint.Showcase()

return BetterPrint
