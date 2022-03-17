local present, hop = pcall(require, "hop")
if not present then
   return
end

require("core.utils")
hop.setup({
  case_insensitive = true,
  char2_fallback_key = '<ESC>',
})

-- nnoremap("s","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")
-- vnoremap("s","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")

-- nnoremap("S","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false })<cr>")
-- vnoremap("S","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=true })<cr>")

nnoremap("f","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")
vnoremap("f","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")
onoremap("f","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=true })<cr>")

nnoremap("F","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false })<cr>")
vnoremap("F","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false })<cr>")
onoremap("F","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false })<cr>")

nnoremap("t","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")
vnoremap("t","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")
onoremap("t","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump=false })<cr>")

nnoremap("T","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false })<cr>")
vnoremap("T","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=true})<cr>")
onoremap("T","<cmd>lua require'hop'.hint_char2({ direction=require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump=false})<cr>")
