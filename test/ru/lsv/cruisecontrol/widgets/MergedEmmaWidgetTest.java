/**
 * 
 */
package ru.lsv.cruisecontrol.widgets;

import static org.junit.Assert.*;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

import org.junit.Test;

/**
 * @author admin
 * 
 */
public class MergedEmmaWidgetTest {

    private MergedEmmaWidget widget = new MergedEmmaWidget();

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedEmmaWidget#getOutput(java.util.Map)}
     * .
     */
    @Test
    public final void testGetOutput() {
        Map map = new HashMap();
        map.put(Widget.PARAM_BUILD_LOG_FILE, new File("log20130426130426.xml"));
        System.out.println(widget.getOutput(map));
    }

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedEmmaWidget#getDisplayName()}.
     */
    @Test
    public final void testGetDisplayName() {
        "Merged Emma".equals(widget.getDisplayName());
    }
}
