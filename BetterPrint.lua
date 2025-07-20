local BetterPrint = {}

function BetterPrint.print(options, ...)
    if options.type == 'error' then
        print('ERROR: '.. ...)
    end
    if options.type == 'warning' then
        print('WARNING: '.. ...)
    end
    if options.type == 'info' then
        print('INFO: '.. ...)
    end
    if options.type == 'success' then
        print('SUCCESS: '.. ...)
    end
end

-- BetterPrint.print({type = 'success'}, 'The script works!')

return BetterPrint
