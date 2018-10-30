-- wc, by mtvjr
-- Returns the number of newlines, words, and bytes in a file
-- NOTE: Currently assumes all characters are ASCII, so bytes = number of characters

function wordcount(str)
    local bytes = string.len(str)
    local words = 0
    local newlines = 0
    local inWord = false
    for c in str:gmatch(".") do
        if c:gmatch("%s")() then
            -- Character is whitespace, end the current word
            inWord = false
            if c == '\n' then
                newlines = newlines + 1
            end
        else 
            -- Character is not whitespace
            if inWord == false then
                inWord = true
                words = words + 1
            end
        end
    end

    return newlines, words, bytes
end


