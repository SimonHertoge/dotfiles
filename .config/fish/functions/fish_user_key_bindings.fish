function fish_user_key_bindings
  fish_hybrid_key_bindings
  fzf_key_bindings
  bind -k f2 edit_cmd
  bind \ch backward-kill-word
  bind yy fish_clipboard_copy
  bind p fish_clipboard_paste
end
