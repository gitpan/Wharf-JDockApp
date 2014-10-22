#include "jDockApp.h"

int  loop_delay   = 1000;
int  update_delay =   60;

void clear_window() {
    copyXPMArea(587, 0, 64, 64, 0, 0);
}

void set_update_delay(int i) { update_delay = i; }
void set_loop_delay(int i)   { loop_delay   = i; }

void start_app() {
    XEvent event;
    long update_delay_counter;

    int    argc  = 1;
    char **argv;

    argv    = (char **) alloca((sizeof(char*)) * argc);
    argv[0] = (char *)  alloca((sizeof(char) ) * 10);

    sprintf(argv[0], "jDockApp");

    initXwindow(argc, argv);
    openXwindow(argc, argv, jDockApp_main_xpm, jDockApp_mask_xpm,
        mask_width, mask_height, "#000000", "#000000", "#000000", 
        "#000000", "#000000"
    );

    setup();

    do_update();

    update_delay_counter = 100000 * update_delay;

    while(true) {
        RedrawWindow();

        while(XPending(display)) {
            XNextEvent(display, &event);
            switch(event.type) {
                case Expose:
                    do_expose();
                    RedrawWindow();
                    break;
                case ButtonRelease:
                    do_button_release();
                    RedrawWindow();
                    break;
                case EnterNotify:
                    XSetInputFocus(display, 
                        PointerRoot, RevertToParent, CurrentTime);
                    break;
                case LeaveNotify:
                    XSetInputFocus(display, 
                        PointerRoot, RevertToParent, CurrentTime);
                break;
            }
        }
        usleep(1000);
        update_delay_counter -= 1000;
        if(update_delay_counter<=0) {
            do_update();
            update_delay_counter = 100000 * update_delay;
        }
    }

    return;
}
