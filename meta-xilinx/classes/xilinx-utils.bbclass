# Copyright (C) 2011, Adrian Alonso - SecretLab Technologies
# Released under the MIT license (see packages/COPYING)
# Xilinx Utils: A set of helper funtions

def find_board(a, d):
    # Given a xps project path return the board board model
    board = "unknown"
    if a and os.path.exists(a):
        try:
            xps_proj = os.path.join(a, "system.mhs")
            xps_hwd = file(xps_proj, 'r')

            for l in xps_hwd:
                if "Target Board" in l:
                    board = l
                    break
            # Close file descriptor
            xps_hwd.close()

            if board != "unknown":
                # Strip board board name
                board = board.split()
                return board[6].lower()
            else:
                return board
        except IOError:
            return board
    else:
        return board
