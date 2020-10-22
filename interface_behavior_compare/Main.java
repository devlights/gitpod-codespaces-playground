package interface_behavior_compare;

import java.io.Console;

public class Main {
    public static void main(final String[] args) {
        var impl = new Impl();

        impl.read(null, 0, 0);
        impl.write(null);
        impl.close();

        Reader r = impl;
        r.read(null, 0, 0);

        Writer w = impl;
        w.write(null);

        Closer c = impl;
        c.close();

        // Compile Error: Type mismatch: cannot convert from Closer to ReadWriteCloser
        // ReadWriteCloser rwc = c;
        ReadWriteCloser rwc = impl;
        rwc.read(null, 0, 0);
        rwc.write(null);
        rwc.close();
    }
}

interface Reader {
    int read(byte[] buf, int start, int length);
}

interface Writer {
    int write(byte[] buf);
}

interface Closer {
    void close();
}

interface ReadWriteCloser extends Reader, Writer, Closer {
}

class Impl implements ReadWriteCloser {

    private Console console;

    Impl() {
        this.console = System.console();
    }

    @Override
    public int read(byte[] buf, int start, int length) {
        this.console.printf("[impl.read ] called\n");
        return 0;
    }

    @Override
    public int write(byte[] buf) {
        this.console.printf("[impl.write] called\n");
        return 0;
    }

    @Override
    public void close() {
        this.console.printf("[impl.close] called\n");
    }
}