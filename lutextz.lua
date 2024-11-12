-- lutextz

-- Function to read the content of a file
local function readFile(filePath)
    local file = io.open(filePath, "r")
    if not file then
        print("Error: Could not open file for reading.")
        return nil
    end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to write content to a file
local function writeFile(filePath, content)
    local file = io.open(filePath, "w")
    if not file then
        print("Error: Could not open file for writing.")
        return false
    end
    file:write(content)
    file:close()
    return true
end

-- Main function to run the text editor
local function textEditor()
    print("LuTextZ: A Basic Terminal Text Editor!")
    io.write("Enter new file name: ")
    local filePath = io.read()
    
    local content = readFile(filePath) or ""
    print("Current file content:\n" .. content)

    print("\nStart editing. Type ':w' to save, ':q' to exit without saving, or ':wq' to save and exit.\n")

    -- Buffer for edited content
    local buffer = content

    -- Start editing loop
    while true do
        io.write("> ")
        local input = io.read()
        
        if input == ":w" then
            writeFile(filePath, buffer)
            print("File saved.")
        elseif input == ":q" then
            print("Exiting without saving.")
            break
        elseif input == ":wq" then
            writeFile(filePath, buffer)
            print("File saved and exiting.")
            break
        else
            buffer = buffer .. input .. "\n"
        end
    end
end

-- Run the text editor
textEditor()
