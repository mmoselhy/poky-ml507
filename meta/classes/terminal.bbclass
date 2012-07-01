OE_TERMINAL ?= 'auto'
OE_TERMINAL[type] = 'choice'
OE_TERMINAL[choices] = 'auto none \
                        ${@" ".join(o.name \
                                    for o in oe.terminal.prioritized())}'

OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE'
OE_TERMINAL_EXPORTS[type] = 'list'

XAUTHORITY ?= "${HOME}/.Xauthority"
SHELL ?= "bash"


def oe_terminal(command, title, d):
    import oe.data
    import oe.terminal

    for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
        value = d.getVar(export, True)
        if value is not None:
            os.environ[export] = str(value)

    terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
    if terminal == 'none':
        bb.fatal('Devshell usage disabled with OE_TERMINAL')
    elif terminal != 'auto':
        try:
            oe.terminal.spawn(terminal, command, title)
            return
        except oe.terminal.UnsupportedTerminal:
            bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
                    terminal)
        except oe.terminal.ExecutionError as exc:
            bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))

    try:
        oe.terminal.spawn_preferred(command, title)
    except oe.terminal.NoSupportedTerminals:
        bb.fatal('No valid terminal found, unable to open devshell')
    except oe.terminal.ExecutionError as exc:
        bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
