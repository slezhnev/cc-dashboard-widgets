/**
 * 
 */
package ru.lsv.cruisecontrol.widgets;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import net.sourceforge.cruisecontrol.dashboard.widgets.Widget;

import org.junit.Test;

/**
 * @author s,lezhneg
 * 
 */
public class MergedAndroidTestsErrorsWidgetTest {

    private MergedAndroidTestsErrorsWidget widget =
            new MergedAndroidTestsErrorsWidget();

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedLintWidget#getOutput(java.util.Map)}
     * .
     */
    @SuppressWarnings({
        "rawtypes",
        "unchecked" })
    @Test
    public final void testGetOutput() {
        Map map = new HashMap();
        map.put(Widget.PARAM_BUILD_LOG_FILE, new File("log20140331101621.xml"));
        System.out.println(widget.getOutput(map));
    }

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedLintWidget#getDisplayName()}.
     */
    @Test
    public final void testGetDisplayName() {
        "Failed Android Test".equals(widget.getDisplayName());
    }
}
