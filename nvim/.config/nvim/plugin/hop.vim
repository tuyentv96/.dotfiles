nnoremap s <cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump = false })<cr>
nnoremap S <cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump = false })<cr>
