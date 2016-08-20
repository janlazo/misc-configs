" Checking if gvim is running this
if !(has("gui") && has("gui_running"))
    return
endif

set visualbell                      " don't beep
set noerrorbells                    " i'm serious
