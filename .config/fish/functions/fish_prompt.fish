function fish_prompt
    printf '%s%s%s $ ' (set_color green) (prompt_pwd) (set_color normal)
end
