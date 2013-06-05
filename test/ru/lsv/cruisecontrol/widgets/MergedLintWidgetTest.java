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
 * @author s,lezhneg
 * 
 */
public class MergedLintWidgetTest {

    private MergedLintWidget widget = new MergedLintWidget();

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedLintWidget#getOutput(java.util.Map)}
     * .
     */
    @Test
    public final void testGetOutput() {
        Map map = new HashMap();
        map.put(Widget.PARAM_BUILD_LOG_FILE, new File("log20130605111906Lbuild.1.xml"));
        System.out.println(widget.getOutput(map));
    }

    /**
     * Test method for
     * {@link ru.lsv.cruisecontrol.widgets.MergedLintWidget#getDisplayName()}.
     */
    @Test
    public final void testGetDisplayName() {
        "Merged Lint".equals(widget.getDisplayName());
    }
}
