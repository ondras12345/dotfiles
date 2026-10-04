" Vim syntax file
" Language: pioasm
" Maintainer: Ondřej Sluka
" Created with the help of GPT-6.1-Sol.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syntax case ignore
syntax sync fromstart
" A leading dot is not part of 'iskeyword', so directives need a match.
syntax match pioDirective "\%(^\|\s\)\zs\.\%(define\|program\|origin\|side_set\|wrap_target\|wrap\|lang_opt\|word\)\>"
syntax keyword pioTodo contained TODO FIXME XXX

" Restrict operands and instruction suffixes to instruction lines. Labels may
" share a line with an instruction, including PUBLIC labels.
syntax region pioInstructionLine transparent matchgroup=pioInstruction
    \ start="\%(^\s*\%\(\%\(public\s\+\)\?[a-zA-Z_][0-9a-zA-Z_]*:\s*\)\?\)\@<=\%(jmp\|wait\|in\|out\|push\|pull\|mov\|irq\|set\|nop\)\>"
    \ end="$"
    \ contains=pioOperand,pioLabel,pioPublic,pioInteger,pioHex,pioBinary,pioExpression,pioInstructionOperator,pioSideSet,pioDelay,pioCommentSemicolon,pioCommentSlash,pioCommentM
syntax keyword pioOperand contained pins pindirs x y null isr osr exec pc status
syntax keyword pioOperand contained pin gpio irq osre iffull ifempty block noblock rel nowait clear
syntax keyword pioPublic public
syntax match pioInstructionOperator contained "!=\|--\|::\|[!~]"
syntax keyword pioSideSet contained side nextgroup=pioSideValue,pioExpression skipwhite
syntax match pioSideValue contained "\<[a-zA-Z_][0-9a-zA-Z_]*\>" contains=NONE
syntax match pioSideValue contained "-\?\d\+\|0x[0-9a-f]\+\|0b[01]\+"
syntax region pioDelay contained oneline matchgroup=pioDelimiter start="\[" end="\]"
    \ contains=pioInteger,pioHex,pioBinary,pioIdentifier,pioExpression,pioCommentM

" pioCommentGroup allows adding matches for special things in comments
syntax cluster pioCommentGroup contains=pioTodo,@Spell
syntax region pioCommentSemicolon start=";" end="$" keepend contains=@pioCommentGroup
syntax region pioCommentSlash start="//" end="$" keepend contains=@pioCommentGroup
syntax region pioCommentM start="/\*" end="\*/" contains=@pioCommentGroup

syntax match pioLabel display "\<[a-zA-Z_][0-9a-zA-Z_]*:\ze\%([^:]\|$\)"he=e-1

syntax match pioInteger display "-\?\<\d\+\>"
syntax match pioHex display "\<0x[0-9a-f]\+\>"
syntax match pioBinary display "\<0b[01]\+\>"

" Values contain parenthesised expressions; expressions can nest recursively.
" The oneline regions prevent unfinished expressions from crossing lines.
syntax region pioExpression oneline matchgroup=pioDelimiter start="(" end=")"
    \ contains=pioExpression,pioInteger,pioHex,pioBinary,pioIdentifier,pioExpressionOperator,pioCommentM
syntax match pioIdentifier contained "\<[a-zA-Z_][0-9a-zA-Z_]*\>"
syntax match pioExpressionOperator contained "::\|[+*/-]"

highlight default link pioCommentSlash pioComment
highlight default link pioCommentSemicolon pioComment
highlight default link pioCommentM pioComment

highlight default link pioDirective Statement
highlight default link pioInstruction Statement
highlight default link pioOperand Keyword
highlight default link pioPublic Keyword
highlight default link pioInstructionOperator Operator
highlight default link pioSideSet Keyword
highlight default link pioSideValue Number
highlight default link pioDelay Number
highlight default link pioDelimiter Special
highlight default link pioIdentifier Identifier
highlight default link pioExpressionOperator Operator
highlight default link pioComment Comment
highlight default link pioTodo Todo
highlight default link pioLabel Label
highlight default link pioInteger Number
highlight default link pioHex Number
highlight default link pioBinary Number


let b:current_syntax = "pioasm"
