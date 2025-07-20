//! zig test project
//! this project serves to learn zig and test the behaviour of specific features

const std = @import("std");
const fs = std.fs;

const ncurses = @cImport({
    @cInclude("ncurses.h");
});

pub fn main() !void {
    _ = ncurses.initscr();
    _ = ncurses.raw();
    _ = ncurses.keypad(ncurses.stdscr, true);
    _ = ncurses.noecho();
    _ = ncurses.refresh();
    while (true)
    {
        const c: i32 = ncurses.getch();
        if (c == 'q' or c == '\x1B') break;

        if (c == ncurses.KEY_LEFT)
        {
            _ = ncurses.printw("LEFT\n");
        }
        else if (c == ncurses.KEY_DOWN)
        {
            _ = ncurses.printw("DOWN\n");
        }
        else if (c == ncurses.KEY_UP)
        {
            _ = ncurses.printw("UP\n");
        }
        else if (c == ncurses.KEY_RIGHT)
        {
            _ = ncurses.printw("RIGHT\n");
        }
        else
        {
            _ = ncurses.printw("%c\n", c);
        }
    }
    _ = ncurses.endwin();

}

