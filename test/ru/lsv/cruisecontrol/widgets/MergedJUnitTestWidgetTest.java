package ru.lsv.cruisecontrol.widgets;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

import org.junit.Test;

public class MergedJUnitTestWidgetTest {

    private MergedJUnitTestWidget widget = new MergedJUnitTestWidget();

    @Test
    public final void testGetOutput() {
        Map map = new HashMap();
        map.put(Widget.PARAM_BUILD_LOG_FILE, new File("log20140203135326.xml"));
        System.out.println(widget.getOutput(map));
    }

    @Test
    public final void testGetDisplayName() {
        "Merged tests".equals(widget.getDisplayName());
    }

}
