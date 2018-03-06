////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package mx.core
{ 
COMPILE::JS
{
    import goog.DEBUG;
}
/*
import flash.accessibility.Accessibility;
import flash.accessibility.AccessibilityProperties;
import flash.display.BlendMode;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.InteractiveObject;
import flash.display.Loader;
import flash.display.Shader;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventPhase;
import flash.events.FocusEvent;
import flash.events.IEventDispatcher;
*/
import org.apache.royale.events.KeyboardEvent;
/*
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.PerspectiveProjection;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Transform;
import flash.geom.Vector3D;
import flash.system.ApplicationDomain;
import flash.system.Capabilities;
import flash.text.TextFormatAlign;
import flash.text.TextLineMetrics;
import flash.ui.Keyboard;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
*/
import org.apache.royale.core.UIBase;
/*
import mx.automation.IAutomationObject;
import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.FunctionReturnWatcher;
import mx.binding.PropertyWatcher;
import mx.binding.StaticPropertyWatcher;
import mx.binding.Watcher;
import mx.binding.XMLWatcher;
import mx.controls.IFlexContextMenu;
import mx.core.LayoutDirection;
import mx.effects.EffectManager;
import mx.effects.IEffect;
import mx.effects.IEffectInstance;
import mx.events.ChildExistenceChangedEvent;
import mx.events.DynamicEvent;
import mx.events.EffectEvent;
*/
import mx.events.FlexEvent;
/*
import mx.events.MoveEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;
import mx.events.StateChangeEvent;
import mx.events.ValidationResultEvent;
import mx.filters.BaseFilter;
import mx.filters.IBitmapFilter;
import mx.geom.RoundedRectangle;
import mx.geom.Transform;
import mx.geom.TransformOffsets;
import mx.graphics.shaderClasses.ColorBurnShader;
import mx.graphics.shaderClasses.ColorDodgeShader;
import mx.graphics.shaderClasses.ColorShader;
import mx.graphics.shaderClasses.ExclusionShader;
import mx.graphics.shaderClasses.HueShader;
import mx.graphics.shaderClasses.LuminosityShader;
import mx.graphics.shaderClasses.SaturationShader;
import mx.graphics.shaderClasses.SoftLightShader;
import mx.managers.CursorManager;
*/
import mx.managers.ICursorManager;
import mx.managers.IFocusManager;
/*
import mx.managers.IFocusManagerComponent;
import mx.managers.IFocusManagerContainer;
import mx.managers.ILayoutManagerClient;
*/
import mx.managers.ISystemManager;
/*
import mx.managers.IToolTipManagerClient;
import mx.managers.SystemManager;
import mx.managers.SystemManagerGlobals;
import mx.managers.ToolTipManager;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.states.State;
import mx.states.Transition;
import mx.styles.CSSStyleDeclaration;
import mx.styles.IAdvancedStyleClient;
import mx.styles.ISimpleStyleClient;
import mx.styles.IStyleClient;
import mx.styles.IStyleManager2;
import mx.styles.StyleManager;
import mx.styles.StyleProtoChain;
import mx.utils.ColorUtil;
import mx.utils.GraphicsUtil;
import mx.utils.MatrixUtil;
import mx.utils.NameUtil;
import mx.utils.StringUtil;
import mx.utils.TransformUtil;
import mx.validators.IValidatorListener;
import mx.validators.ValidationResult;
    
use namespace mx_internal;
*/

// Excluding the property to enable code hinting for the layoutDirection style
[Exclude(name="layoutDirection", kind="property")]

/**
 *  The UIComponent class is the base class for all visual components,
 *  both interactive and noninteractive.
 *
 *  <p>An interactive component can participate in tabbing and other kinds of
 *  keyboard focus manipulation, accept low-level events like keyboard and
 *  mouse input, and be disabled so that it does not receive keyboard and
 *  mouse input.
 *  This is in contrast to noninteractive components, like Label and
 *  ProgressBar, which simply display contents and are not manipulated by
 *  the user.</p>
 *  <p>The UIComponent class is not used as an MXML tag, but is used as a base
 *  class for other classes.</p>
 *
 *  @mxml
 *
 *  <p>All user interface components in Flex extend the UIComponent class.
 *  Flex components inherit the following properties from the UIComponent
 *  class:</p>
 *
 *  <pre>
 *  &lt;mx:<i>tagname</i>
 *   <b>Properties </b>
 *    currentState="null"
 *    doubleClickEnabled="false|true"
 *    enabled="true|false"
 *    height="0"
 *    id=""
 *    maxHeight="10000"
 *    maxWidth="10000"
 *    measuredHeight=
 *    measuredMinHeight=
 *    measuredMinWidth=
 *    measuredWidth=
 *    minHeight="0"
 *    minWidth="0"
 *    percentHeight="NaN"
 *    percentWidth="NaN"
 *    states="null"
 *    styleName="undefined"
 *    toolTip="null"
 *    transitions=""
 *    width="0"
 *    x="0"
 *    y="0"
 *
 *  <b>Styles</b>
 *    bottom="undefined"
 *
 *  <b>Events</b>
 *  </pre>
 *
 *  @see mx.core.UIComponent
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class UIComponent extends UIBase
    implements IChildList,
    IFlexDisplayObject,
    IInvalidating,
    IUIComponent, IVisualElement
{

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------


    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function UIComponent()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Variables: Creation
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  initialized
    //----------------------------------

    /**
     *  @private
     *  Storage for the initialized property.
     */
    private var _initialized:Boolean = false;

    [Inspectable(environment="none")]

    /**
     *  A flag that determines if an object has been through all three phases
     *  of layout: commitment, measurement, and layout (provided that any were required).
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get initialized():Boolean
    {
        return _initialized;
    }

    /**
     *  @private
     */
    public function set initialized(value:Boolean):void
    {
        _initialized = value;

        if (value)
        {
            dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
        }
    }

    //--------------------------------------------------------------------------
    //
    //  Variables: Measurement
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Holds the last recorded value of the x property.
     *  Used in dispatching a MoveEvent.
     */
    private var oldX:Number = 0;

    /**
     *  @private
     *  Holds the last recorded value of the y property.
     *  Used in dispatching a MoveEvent.
     */
    private var oldY:Number = 0;

    /**
     *  @private
     *  Holds the last recorded value of the width property.
     *  Used in dispatching a ResizeEvent.
     */
    private var oldWidth:Number = 0;

    /**
     *  @private
     *  Holds the last recorded value of the height property.
     *  Used in dispatching a ResizeEvent.
     */
    private var oldHeight:Number = 0;

    /**
     *  @private
     *  Holds the last recorded value of the minWidth property.
     */
    private var oldMinWidth:Number;

    /**
     *  @private
     *  Holds the last recorded value of the minHeight property.
     */
    private var oldMinHeight:Number;

    /**
     *  @private
     *  Holds the last recorded value of the explicitWidth property.
     */
    private var oldExplicitWidth:Number;

    /**
     *  @private
     *  Holds the last recorded value of the explicitHeight property.
     */
    private var oldExplicitHeight:Number;

    //--------------------------------------------------------------------------
    //
    //  Variables: Styles
    //
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  owner
    //----------------------------------

    /**
     *  @private
     */
    private var _owner:IUIComponent;

    /**
     *  @copy mx.core.IVisualElement#owner
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get owner():IUIComponent
    {
        return _owner ? _owner : parent;
    }

    public function set owner(value:IUIComponent):void
    {
        _owner = value;
    }

    //----------------------------------
    //  doubleClickEnabled
    //----------------------------------

    [Inspectable(enumeration="true,false", defaultValue="true")]

    /**
     *  Specifies whether the UIComponent object receives <code>doubleClick</code> events.
     *  The default value is <code>false</code>, which means that the UIComponent object
     *  does not receive <code>doubleClick</code> events.
     *
     *  <p>The <code>mouseEnabled</code> property must also be set to <code>true</code>,
     *  its default value, for the object to receive <code>doubleClick</code> events.</p>
     *
     *  @default false
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    COMPILE::SWF
    override public function get doubleClickEnabled():Boolean
    {
        // TODO
        if (GOOG::DEBUG)
            trace("doubleClickEnabled not implemented");
        return false;
    }
    COMPILE::JS
    public function get doubleClickEnabled():Boolean
    {
        // TODO
        if (GOOG::DEBUG)
            trace("doubleClickEnabled not implemented");
        return false;
    }

    /**
     *  @private
     *  Propagate to children.
     */
    COMPILE::SWF
    override public function set doubleClickEnabled(value:Boolean):void
    {
        // TODO
        if (goog.DEBUG)
            trace("doubleClickEnabled not implemented");
    }
    COMPILE::JS
    public function set doubleClickEnabled(value:Boolean):void
    {
        // TODO
        if (goog.DEBUG)
            trace("doubleClickEnabled not implemented");
    }

    //----------------------------------
    //  enabled
    //----------------------------------

    /**
     *  @private
     */
    private var _enabled:Boolean = false;

    [Inspectable(category="General", enumeration="true,false", defaultValue="true")]

    /**
     *  @copy mx.core.IUIComponent#enabled
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get enabled():Boolean
    {
        // TODO
        if (goog.DEBUG)
            trace("enabled not implemented");
        return _enabled;
    }

    /**
     *  @private
     */
    public function set enabled(value:Boolean):void
    {
        // TODO
        if (goog.DEBUG)
            trace("enabled not implemented");
        _enabled = value;
    }

    //----------------------------------
    //  cacheAsBitmap
    //----------------------------------

    /**
     *  @private
     */
    override public function set cacheAsBitmap(value:Boolean):void
    {
        // TODO
        if (goog.DEBUG)
            trace("cacheAsBitmap not implemented");
    }

    //----------------------------------
    //  filters
    //----------------------------------

    /**
     *  @private
     *  Storage for the filters property.
     */
    private var _filters:Array;

    /**
     *  @private
     */
    override public function get filters():Array
    {
        return _filters ? _filters : super.filters;
    }

    /**
     *  @private
     */
    override public function set filters(value:Array):void
    {
        // TODO
        if (goog.DEBUG)
            trace("filters not implemented");
    }

       
    //--------------------------------------------------------------------------
    //
    //  Properties: Manager access
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  cursorManager
    //----------------------------------

    /**
     *  Gets the CursorManager that controls the cursor for this component
     *  and its peers.
     *  Each top-level window has its own instance of a CursorManager;
     *  To make sure you're talking to the right one, use this method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get cursorManager():ICursorManager
    {
        // TODO
        if (goog.DEBUG)
            trace("cursorManager not implemented");


        //return CursorManager.getInstance();
    }

    //----------------------------------
    //  focusManager
    //----------------------------------

    /**
     *  @private
     *  Storage for the focusManager property.
     */
    private var _focusManager:IFocusManager;

    [Inspectable(environment="none")]

    /**
     *  Gets the FocusManager that controls focus for this component
     *  and its peers.
     *  Each popup has its own focus loop and therefore its own instance
     *  of a FocusManager.
     *  To make sure you're talking to the right one, use this method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get focusManager():IFocusManager
    {
        // TODO
        if (goog.DEBUG)
            trace("focusManager not implemented");
        return null;
    }

    /**
     *  @private
     *  IFocusManagerContainers have this property assigned by the framework
     */
    public function set focusManager(value:IFocusManager):void
    {
        // TODO
        if (goog.DEBUG)
            trace("focusManager not implemented");
    }
    
    //----------------------------------
    //  systemManager
    //----------------------------------

    /**
     *  @private
     *  Storage for the systemManager property.
     *  Set by the SystemManager so that each UIComponent
     *  has a references to its SystemManager
     */
    private var _systemManager:ISystemManager;

    [Inspectable(environment="none")]

    /**
     *  Returns the SystemManager object used by this component.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get systemManager():ISystemManager
    {
        // TODO
        if (goog.DEBUG)
            trace("systemManager not implemented");
        return _systemManager;
    }

    /**
     *  @private
     */
    public function set systemManager(value:ISystemManager):void
    {
        // TODO
        if (goog.DEBUG)
            trace("systemManager not implemented");
        _systemManager = value;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties: MXML
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  parentApplication
    //----------------------------------

    [Bindable("initialize")]

    /*
     *  Note:
     *  There are two reasons that 'parentApplication' is typed as Object
     *  rather than as Application. The first is that typing it as Application
     *  would make UIComponent dependent on Application, slowing down compile
     *  times not only for SWCs for also for MXML and AS components. The
     *  second is that authors would not be able to access properties and
     *  methods in the <Script> of their <Application> without casting it
     *  to their application's subclass, as in
     *     MyApplication(paentApplication).myAppMethod().
     *  Therefore we decided to dispense with strict typing for
     *  'parentApplication'.
     */
    /**
     *  A reference to the Application object that contains this UIComponent
     *  instance.
     *  This Application object might exist in a SWFLoader control in another
     *  Application, and so on, creating a chain of Application objects that
     *  can be walked using parentApplication.
     *
     *  <p>The <code>parentApplication</code> property of an Application is never itself;
     *  it is either the Application into which it was loaded or null
     *  (for the top-level Application).</p>
     *
     *  <p>Walking the application chain using the <code>parentApplication</code>
     *  property is similar to walking the document chain using the
     *  <code>parentDocument</code> property.
     *  You can access the top-level application using the
     *  <code>application</code> property of the Application class.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get parentApplication():Object
    {
        // Look for the SystemManager's document,
        // which should be the Application.
        var o:Object = systemManager.document;

        // If this UIComponent is its own root, then it is an Application.
        // We want to return its parent Application, or null
        // (if it has no parent because it is the top-level Application).
        // The hierarchy in this situation looks something like this:
        //
        //  SystemManager
        //      Application
        //          SomeContainer
        //              Loader
        //                  Loaded App's SystemManager
        //                      Application
        //                          ThisComponent
        if (o == this)
        {
            var p:UIComponent = o.systemManager.parent as UIComponent;
            o = p ? p.systemManager.document : null;
        }

        return o;
    }

    //----------------------------------
    //  parentDocument
    //----------------------------------

    [Bindable("initialize")]

    /**
     *  A reference to the parent document object for this UIComponent.
     *  A document object is a UIComponent at the top of the hierarchy
     *  of a Flex application, MXML component, or AS component.
     *
     *  <p>For the Application object, the <code>parentDocument</code>
     *  property is null.
     *  This property  is useful in MXML scripts to go up a level
     *  in the chain of document objects.
     *  It can be used to walk this chain using
     *  <code>parentDocument.parentDocument</code>, and so on.</p>
     *
     *  <p>It is typed as Object so that authors can access properties
     *  and methods on ancestor document objects without casting.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get parentDocument():Object
    {
        if (document == this)
        {
            var p:IUIComponent = parent as IUIComponent;
            if (p)
                return p.document;

            var sm:ISystemManager = parent as ISystemManager;
            if (sm)
                return sm.document;

            return null;
        }
        else
        {
            return document;
        }
    }

    //--------------------------------------------------------------------------
    //
    //  Properties: Measurement
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  measuredMinWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the measuredMinWidth property.
     */
    private var _measuredMinWidth:Number = 0;

    [Inspectable(environment="none")]

    /**
     *  The default minimum width of the component, in pixels.
     *  This value is set by the <code>measure()</code> method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get measuredMinWidth():Number
    {
        return _measuredMinWidth;
    }

    /**
     *  @private
     */
    public function set measuredMinWidth(value:Number):void
    {
        _measuredMinWidth = value;
    }

    //----------------------------------
    //  measuredMinHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the measuredMinHeight property.
     */
    private var _measuredMinHeight:Number = 0;

    [Inspectable(environment="none")]

    /**
     *  The default minimum height of the component, in pixels.
     *  This value is set by the <code>measure()</code> method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get measuredMinHeight():Number
    {
        return _measuredMinHeight;
    }

    /**
     *  @private
     */
    public function set measuredMinHeight(value:Number):void
    {
        _measuredMinHeight = value;
    }

    //----------------------------------
    //  measuredWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the measuredWidth property.
     */
    private var _measuredWidth:Number = 0;

    [Inspectable(environment="none")]

    /**
     *  The default width of the component, in pixels.
     *  This value is set by the <code>measure()</code> method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get measuredWidth():Number
    {
        return _measuredWidth;
    }

    /**
     *  @private
     */
    public function set measuredWidth(value:Number):void
    {
        _measuredWidth = value;
    }

    //----------------------------------
    //  measuredHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the measuredHeight property.
     */
    private var _measuredHeight:Number = 0;

    [Inspectable(environment="none")]

    /**
     *  The default height of the component, in pixels.
     *  This value is set by the <code>measure()</code> method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get measuredHeight():Number
    {
        return _measuredHeight;
    }

    /**
     *  @private
     */
    public function set measuredHeight(value:Number):void
    {
        _measuredHeight = value;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties: Layout
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  percentWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the percentWidth property.
     */
    private var _percentWidth:Number;

    [Bindable("resize")]
    [Inspectable(environment="none")]

    /**
     *  Specifies the width of a component as a percentage
     *  of its parent's size. Allowed values are 0-100. The default value is NaN.
     *  Setting the <code>width</code> or <code>explicitWidth</code> properties
     *  resets this property to NaN.
     *
     *  <p>This property returns a numeric value only if the property was
     *  previously set; it does not reflect the exact size of the component
     *  in percent.</p>
     *
     *  <p>This property is always set to NaN for the UITextField control.</p>
     * 
     *  <p>When used with Spark layouts, this property is used to calculate the
     *  width of the component's bounds after scaling and rotation. For example 
     *  if the component is rotated at 90 degrees, then specifying 
     *  <code>percentWidth</code> will affect the component's height.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get percentWidth():Number
    {
        return _percentWidth;
    }

    /**
     *  @private
     */
    public function set percentWidth(value:Number):void
    {
        if (_percentWidth == value)
            return;

        if (!isNaN(value))
            _explicitWidth = NaN;

        _percentWidth = value;

         invalidateParentSizeAndDisplayList();
    }

    //----------------------------------
    //  percentHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the percentHeight property.
     */
    private var _percentHeight:Number;

    [Bindable("resize")]
    [Inspectable(environment="none")]

    /**
     *  Specifies the height of a component as a percentage
     *  of its parent's size. Allowed values are 0-100. The default value is NaN.
     *  Setting the <code>height</code> or <code>explicitHeight</code> properties
     *  resets this property to NaN.
     *
     *  <p>This property returns a numeric value only if the property was
     *  previously set; it does not reflect the exact size of the component
     *  in percent.</p>
     *
     *  <p>This property is always set to NaN for the UITextField control.</p>
     *  
     *  <p>When used with Spark layouts, this property is used to calculate the
     *  height of the component's bounds after scaling and rotation. For example 
     *  if the component is rotated at 90 degrees, then specifying 
     *  <code>percentHeight</code> will affect the component's width.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get percentHeight():Number
    {
        return _percentHeight;
    }

    /**
     *  @private
     */
    public function set percentHeight(value:Number):void
    {
        if (_percentHeight == value)
            return;

        if (!isNaN(value))
            _explicitHeight = NaN;

        _percentHeight = value;

        invalidateParentSizeAndDisplayList();
    }

    //----------------------------------
    //  minWidth
    //----------------------------------

    [Bindable("explicitMinWidthChanged")]
    [Inspectable(category="Size", defaultValue="0")]

    /**
     *  The minimum recommended width of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels. The default value depends on
     *  the component's implementation.
     *
     *  <p>If the application developer sets the value of minWidth,
     *  the new value is stored in explicitMinWidth. The default value of minWidth
     *  does not change. As a result, at layout time, if
     *  minWidth was explicitly set by the application developer, then the value of
     *  explicitMinWidth is used for the component's minimum recommended width.
     *  If minWidth is not set explicitly by the application developer, then the value of
     *  measuredMinWidth is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>minWidth</code> with respect to its parent
     *  is affected by the <code>scaleX</code> property.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get minWidth():Number
    {
        if (!isNaN(explicitMinWidth))
            return explicitMinWidth;

        return measuredMinWidth;
    }

    /**
     *  @private
     */
    public function set minWidth(value:Number):void
    {
        if (explicitMinWidth == value)
            return;

        explicitMinWidth = value;
    }

    //----------------------------------
    //  minHeight
    //----------------------------------

    [Bindable("explicitMinHeightChanged")]
    [Inspectable(category="Size", defaultValue="0")]

    /**
     *  The minimum recommended height of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels. The default value depends on
     *  the component's implementation.
     *
     *  <p>If the application developer sets the value of minHeight,
     *  the new value is stored in explicitMinHeight. The default value of minHeight
     *  does not change. As a result, at layout time, if
     *  minHeight was explicitly set by the application developer, then the value of
     *  explicitMinHeight is used for the component's minimum recommended height.
     *  If minHeight is not set explicitly by the application developer, then the value of
     *  measuredMinHeight is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>minHeight</code> with respect to its parent
     *  is affected by the <code>scaleY</code> property.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get minHeight():Number
    {
        if (!isNaN(explicitMinHeight))
            return explicitMinHeight;

        return measuredMinHeight;
    }

    /**
     *  @private
     */
    public function set minHeight(value:Number):void
    {
        if (explicitMinHeight == value)
            return;

        explicitMinHeight = value;
    }

    //----------------------------------
    //  maxWidth
    //----------------------------------

    [Bindable("explicitMaxWidthChanged")]
    [Inspectable(category="Size", defaultValue="10000")]

    /**
     *  The maximum recommended width of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels. The default value of this property is
     *  set by the component developer.
     *
     *  <p>The component developer uses this property to set an upper limit on the
     *  width of the component.</p>
     *
     *  <p>If the application developer overrides the default value of maxWidth,
     *  the new value is stored in explicitMaxWidth. The default value of maxWidth
     *  does not change. As a result, at layout time, if
     *  maxWidth was explicitly set by the application developer, then the value of
     *  explicitMaxWidth is used for the component's maximum recommended width.
     *  If maxWidth is not set explicitly by the user, then the default value is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>maxWidth</code> with respect to its parent
     *  is affected by the <code>scaleX</code> property.
     *  Some components have no theoretical limit to their width.
     *  In those cases their <code>maxWidth</code> is set to
     *  <code>UIComponent.DEFAULT_MAX_WIDTH</code>.</p>
     *
     *  @default 10000
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get maxWidth():Number
    {
        return !isNaN(explicitMaxWidth) ?
               explicitMaxWidth :
               DEFAULT_MAX_WIDTH;
    }

    /**
     *  @private
     */
    public function set maxWidth(value:Number):void
    {
        if (explicitMaxWidth == value)
            return;

        explicitMaxWidth = value;
    }

    //----------------------------------
    //  maxHeight
    //----------------------------------

    [Bindable("explicitMaxHeightChanged")]
    [Inspectable(category="Size", defaultValue="10000")]

    /**
     *  The maximum recommended height of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels. The default value of this property is
     *  set by the component developer.
     *
     *  <p>The component developer uses this property to set an upper limit on the
     *  height of the component.</p>
     *
     *  <p>If the application developer overrides the default value of maxHeight,
     *  the new value is stored in explicitMaxHeight. The default value of maxHeight
     *  does not change. As a result, at layout time, if
     *  maxHeight was explicitly set by the application developer, then the value of
     *  explicitMaxHeight is used for the component's maximum recommended height.
     *  If maxHeight is not set explicitly by the user, then the default value is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     * 
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>maxHeight</code> with respect to its parent
     *  is affected by the <code>scaleY</code> property.
     *  Some components have no theoretical limit to their height.
     *  In those cases their <code>maxHeight</code> is set to
     *  <code>UIComponent.DEFAULT_MAX_HEIGHT</code>.</p>
     *
     *  @default 10000
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get maxHeight():Number
    {
        return !isNaN(explicitMaxHeight) ?
               explicitMaxHeight :
               DEFAULT_MAX_HEIGHT;
    }

    /**
     *  @private
     */
    public function set maxHeight(value:Number):void
    {
        if (explicitMaxHeight == value)
            return;

        explicitMaxHeight = value;
    }

    //----------------------------------
    //  explicitMinWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the minWidth property.
     */
    private var _explicitMinWidth:Number;

    [Bindable("explicitMinWidthChanged")]
    [Inspectable(environment="none")]

    /**
     *  The minimum recommended width of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels.
     *
     *  <p>Application developers typically do not set the explicitMinWidth property. Instead, they
     *  set the value of the minWidth property, which sets the explicitMinWidth property. The
     *  value of minWidth does not change.</p>
     *
     *  <p>At layout time, if minWidth was explicitly set by the application developer, then
     *  the value of explicitMinWidth is used. Otherwise, the value of measuredMinWidth
     *  is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>minWidth</code> with respect to its parent
     *  is affected by the <code>scaleX</code> property.</p>
     *
     *  @default NaN
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitMinWidth():Number
    {
        return _explicitMinWidth;
    }

    /**
     *  @private
     */
    public function set explicitMinWidth(value:Number):void
    {
        if (_explicitMinWidth == value)
            return;

        _explicitMinWidth = value;

        // We invalidate size because locking in width
        // may change the measured height in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitMinWidthChanged"));
    }

    //----------------------------------
    //  minHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the minHeight property.
     */
    private var _explicitMinHeight:Number;

    [Bindable("explictMinHeightChanged")]
    [Inspectable(environment="none")]

    /**
     *  The minimum recommended height of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels.
     *
     *  <p>Application developers typically do not set the explicitMinHeight property. Instead, they
     *  set the value of the minHeight property, which sets the explicitMinHeight property. The
     *  value of minHeight does not change.</p>
     *
     *  <p>At layout time, if minHeight was explicitly set by the application developer, then
     *  the value of explicitMinHeight is used. Otherwise, the value of measuredMinHeight
     *  is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>minHeight</code> with respect to its parent
     *  is affected by the <code>scaleY</code> property.</p>
     *
     *  @default NaN
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitMinHeight():Number
    {
        return _explicitMinHeight;
    }

    /**
     *  @private
     */
    public function set explicitMinHeight(value:Number):void
    {
        if (_explicitMinHeight == value)
            return;

        _explicitMinHeight = value;

        // We invalidate size because locking in height
        // may change the measured width in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitMinHeightChanged"));
    }

    //----------------------------------
    //  explicitMaxWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the maxWidth property.
     */
    private var _explicitMaxWidth:Number;

    [Bindable("explicitMaxWidthChanged")]
    [Inspectable(environment="none")]

    /**
     *  The maximum recommended width of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels.
     *
     *  <p>Application developers typically do not set the explicitMaxWidth property. Instead, they
     *  set the value of the maxWidth property, which sets the explicitMaxWidth property. The
     *  value of maxWidth does not change.</p>
     *
     *  <p>At layout time, if maxWidth was explicitly set by the application developer, then
     *  the value of explicitMaxWidth is used. Otherwise, the default value for maxWidth
     *  is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>maxWidth</code> with respect to its parent
     *  is affected by the <code>scaleX</code> property.
     *  Some components have no theoretical limit to their width.
     *  In those cases their <code>maxWidth</code> is set to
     *  <code>UIComponent.DEFAULT_MAX_WIDTH</code>.</p>
     *
     *  @default NaN
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitMaxWidth():Number
    {
        return _explicitMaxWidth;
    }

    /**
     *  @private
     */
    public function set explicitMaxWidth(value:Number):void
    {
        if (_explicitMaxWidth == value)
            return;

        _explicitMaxWidth = value;

        // Se invalidate size because locking in width
        // may change the measured height in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitMaxWidthChanged"));
    }

    //----------------------------------
    //  explicitMaxHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the maxHeight property.
     */
    private var _explicitMaxHeight:Number;

    [Bindable("explicitMaxHeightChanged")]
    [Inspectable(environment="none")]

    /**
     *  The maximum recommended height of the component to be considered
     *  by the parent during layout. This value is in the
     *  component's coordinates, in pixels.
     *
     *  <p>Application developers typically do not set the explicitMaxHeight property. Instead, they
     *  set the value of the maxHeight property, which sets the explicitMaxHeight property. The
     *  value of maxHeight does not change.</p>
     *
     *  <p>At layout time, if maxHeight was explicitly set by the application developer, then
     *  the value of explicitMaxHeight is used. Otherwise, the default value for maxHeight
     *  is used.</p>
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>maxHeight</code> with respect to its parent
     *  is affected by the <code>scaleY</code> property.
     *  Some components have no theoretical limit to their height.
     *  In those cases their <code>maxHeight</code> is set to
     *  <code>UIComponent.DEFAULT_MAX_HEIGHT</code>.</p>
     *
     *  @default NaN
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitMaxHeight():Number
    {
        return _explicitMaxHeight;
    }

    /**
     *  @private
     */
    public function set explicitMaxHeight(value:Number):void
    {
        if (_explicitMaxHeight == value)
            return;

        _explicitMaxHeight = value;

        // Se invalidate size because locking in height
        // may change the measured width in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitMaxHeightChanged"));
    }

    //----------------------------------
    //  explicitWidth
    //----------------------------------

    /**
     *  @private
     *  Storage for the explicitWidth property.
     */
    private var _explicitWidth:Number;

    [Bindable("explicitWidthChanged")]
    [Inspectable(environment="none")]

    /**
     *  Number that specifies the explicit width of the component,
     *  in pixels, in the component's coordinates.
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>explicitWidth</code> with respect to its parent
     *  is affected by the <code>scaleX</code> property.</p>
     *  <p>Setting the <code>width</code> property also sets this property to
     *  the specified width value.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitWidth():Number
    {
        return _explicitWidth;
    }

    /**
     *  @private
     */
    public function set explicitWidth(value:Number):void
    {
        if (_explicitWidth == value)
            return;

        // width can be pixel or percent not both
        if (!isNaN(value))
            _percentWidth = NaN;

        _explicitWidth = value;

        // We invalidate size because locking in width
        // may change the measured height in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitWidthChanged"));
    }

    //----------------------------------
    //  explicitHeight
    //----------------------------------

    /**
     *  @private
     *  Storage for the explicitHeight property.
     */
    private var _explicitHeight:Number;

    [Bindable("explicitHeightChanged")]
    [Inspectable(environment="none")]

    /**
     *  Number that specifies the explicit height of the component,
     *  in pixels, in the component's coordinates.
     *
     *  <p>This value is used by the container in calculating
     *  the size and position of the component.
     *  It is not used by the component itself in determining
     *  its default size.
     *  Thus this property may not have any effect if parented by
     *  Container, or containers that don't factor in
     *  this property.
     *  Because the value is in component coordinates,
     *  the true <code>explicitHeight</code> with respect to its parent
     *  is affected by the <code>scaleY</code> property.</p>
     *  <p>Setting the <code>height</code> property also sets this property to
     *  the specified height value.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get explicitHeight():Number
    {
        return _explicitHeight;
    }

    /**
     *  @private
     */
    public function set explicitHeight(value:Number):void
    {
        if (_explicitHeight == value)
            return;

        // height can be pixel or percent, not both
        if (!isNaN(value))
            _percentHeight = NaN;

        _explicitHeight = value;

        // We invalidate size because locking in height
        // may change the measured width in flow-based components.
        invalidateSize();
        invalidateParentSizeAndDisplayList();

        dispatchEvent(new Event("explicitHeightChanged"));
    }
    

    //----------------------------------
    //  includeInLayout
    //----------------------------------

    /**
     *  @private
     *  Storage for the includeInLayout property.
     */
    private var _includeInLayout:Boolean = true;

    [Bindable("includeInLayoutChanged")]
    [Inspectable(category="General", defaultValue="true")]

    /**
     *  Specifies whether this component is included in the layout of the
     *  parent container.
     *  If <code>true</code>, the object is included in its parent container's
     *  layout and is sized and positioned by its parent container as per its layout rules.
     *  If <code>false</code>, the object size and position are not affected by its parent container's
     *  layout.
     * 
     *  @default true
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get includeInLayout():Boolean
    {
        return _includeInLayout;
    }

    /**
     *  @private
     */
    public function set includeInLayout(value:Boolean):void
    {
        if (_includeInLayout != value)
        {
            _includeInLayout = value;

            var p:IInvalidating = parent as IInvalidating;
            if (p)
            {
                p.invalidateSize();
                p.invalidateDisplayList();
            }

            dispatchEvent(new Event("includeInLayoutChanged"));
        }
    }
    
    //--------------------------------------------------------------------------
    //
    //  Properties: States
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  currentState
    //----------------------------------

    /**
     *  @private
     *  Storage for the currentState property.
     */
    private var _currentState:String;

    /**
     *  @private
     *  Pending current state name.
     */
    private var requestedCurrentState:String;

    /**
     *  @private
     *  Flag to play state transition
     */
    private var playStateTransition:Boolean = true;

    /**
     *  @private
     *  Flag that is set when the currentState has changed and needs to be
     *  committed.
     *  This property name needs the initial underscore to avoid collisions
     *  with the "currentStateChange" event attribute.
     */
    private var _currentStateChanged:Boolean;

    [Bindable("currentStateChange")]

    /**
     *  The current view state of the component.
     *  Set to <code>""</code> or <code>null</code> to reset
     *  the component back to its base state.
     *
     *  <p>When you use this property to set a component's state,
     *  Flex applies any transition you have defined.
     *  You can also use the <code>setCurrentState()</code> method to set the
     *  current state; this method can optionally change states without
     *  applying a transition.</p>
     *
     *  @see #setCurrentState()
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get currentState():String
    {
        return _currentStateChanged ? requestedCurrentState : _currentState;
    }

    /**
     *  @private
     */
    public function set currentState(value:String):void
    {
        // We have a deferred state change currently queued up, let's override
        // the originally requested state with the newly requested. Otherwise
        // we'll synchronously assign our new state.
        if (_currentStateDeferred != null) 
            _currentStateDeferred = value;
        else
            setCurrentState(value, true);
    }

    /**
     *  @private
     *  Backing variable for currentStateDeferred property
     */
    private var _currentStateDeferred:String;
    
    /**
     *  @private
     *  Version of currentState property that defers setting currentState
     *  until commitProperties() time. This is used by SetProperty.remove()
     *  to avoid causing state transitions when currentState is being rolled
     *  back in a state change operation just to be set immediately after to the
     *  actual new currentState value. This avoids unnecessary, and sometimes
     *  incorrect, use of transitions based on this transient state of currentState.
     */
    private function get currentStateDeferred():String
    {
        return (_currentStateDeferred != null) ? _currentStateDeferred : currentState;
    }

    /**
     *  @private
     */
    private function set currentStateDeferred(value:String):void
    {
        _currentStateDeferred = value;
        if (value != null)
            invalidateProperties();
    }
    

    //----------------------------------
    //  states
    //----------------------------------

    private var _states:Array /* of State */ = [];

    [Inspectable(arrayType="mx.states.State")]
    [ArrayElementType("mx.states.State")]

    /**
     *  The view states that are defined for this component.
     *  You can specify the <code>states</code> property only on the root
     *  of the application or on the root tag of an MXML component.
     *  The compiler generates an error if you specify it on any other control.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get states():Array
    {
        return _states;
    }

    /**
     *  @private
     */
    public function set states(value:Array):void
    {
        _states = value;
    }

    //----------------------------------
    //  transitions
    //----------------------------------

    private var _transitions:Array /* of Transition */ = [];

    [Inspectable(arrayType="mx.states.Transition")]
    [ArrayElementType("mx.states.Transition")]

    /**
     *  An Array of Transition objects, where each Transition object defines a
     *  set of effects to play when a view state change occurs.
     *
     *  @see mx.states.Transition
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get transitions():Array
    {
        return _transitions;
    }

    /**
     *  @private
     */
    public function set transitions(value:Array):void
    {
        _transitions = value;
    }
    //--------------------------------------------------------------------------
    //
    //  Properties: Other
    //
    //--------------------------------------------------------------------------


    //----------------------------------
    //  styleName
    //----------------------------------

    /**
     *  @private
     *  Storage for the styleName property.
     */
    private var _styleName:Object /* String, CSSStyleDeclaration, or UIComponent */;

    [Inspectable(category="General")]

    /**
     *  The class style used by this component. This can be a String, CSSStyleDeclaration
     *  or an IStyleClient.
     *
     *  <p>If this is a String, it is the name of one or more whitespace delimited class
     *  declarations in an <code>&lt;fx:Style&gt;</code> tag or CSS file. You do not include the period
     *  in the <code>styleName</code>. For example, if you have a class style named <code>".bigText"</code>,
     *  set the <code>styleName</code> property to <code>"bigText"</code> (no period).</p>
     *
     *  <p>If this is an IStyleClient (typically a UIComponent), all styles in the
     *  <code>styleName</code> object are used by this component.</p>
     *
     *  @default null
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get styleName():Object /* String, CSSStyleDeclaration, or UIComponent */
    {
        return _styleName;
    }

    /**
     *  @private
     */
    public function set styleName(value:Object /* String, CSSStyleDeclaration, or UIComponent */):void
    {
        if (_styleName === value)
            return;

        _styleName = value;

        // TODO
        if (goog.DEBUG)
            trace("styleName not implemented");
    }

    //----------------------------------
    //  toolTip
    //----------------------------------

    /**
     *  @private
     *  Storage for the toolTip property.
     */
    private var _toolTip:String;

    [Bindable("toolTipChanged")]
    [Inspectable(category="General", defaultValue="null")]

    /**
     *  Text to display in the ToolTip.
     *
     *  @default null
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get toolTip():String
    {
        return _toolTip;
    }

    /**
     *  @private
     */
    public function set toolTip(value:String):void
    {
        var oldValue:String = _toolTip;
        _toolTip = value;

        // TODO
        if (goog.DEBUG)
            trace("toolTip not implemented");

        dispatchEvent(new Event("toolTipChanged"));
    }

    //--------------------------------------------------------------------------
    //
    //  Properties: Popups
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  isPopUp
    //----------------------------------

    /**
     *  @private
     */
    private var _isPopUp:Boolean;

    [Inspectable(environment="none")]

    /**
     *  Set to <code>true</code> by the PopUpManager to indicate
     *  that component has been popped up.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get isPopUp():Boolean
    {
        return _isPopUp;
    }
    public function set isPopUp(value:Boolean):void
    {
        _isPopUp = value;
    }


    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    override public function addChild(child:IUIComponent):IUIComponent
    {
        // TODO
        if (goog.DEBUG)
            trace("addChild not implemented");


        return child;
    }

    /**
     *  @private
     */
    override public function addChildAt(child:IUIComponent,
                                        index:int):IUIComponent
    {
        // TODO
        if (goog.DEBUG)
            trace("addChildAt not implemented");        
        
        return child;
    }

    /**
     *  @private
     */
    override public function removeChild(child:IUIComponent):IUIComponent
    {
        // TODO
        if (goog.DEBUG)
            trace("removeChild not implemented");        
        
        return child;
    }

    
    /**
     *  @private
     */
    override public function removeChildAt(index:int):IUIComponent
    {
        // TODO
        if (goog.DEBUG)
            trace("removeChildAt not implemented");
        
        var child:IUIComponent = getChildAt(index);
        
        return child;
    }


    /**
     *  @private
     */
    COMPILE::SWF
    override public function startDrag():void
    {
        if (goog.DEBUG)
            trace("startDrag not implemented");
    }
    COMPILE::JS
    public function startDrag():void
    {
        if (goog.DEBUG)
            trace("startDrag not implemented");
    }

    /**
     *  @private
     */
    COMPILE::SWF
    override public function stopDrag():void
    {
        if (goog.DEBUG)
            trace("stopDrag not implemented");
    }
    COMPILE::JS
    public function stopDrag():void
    {
        if (goog.DEBUG)
            trace("stopDrag not implemented");
    }
    

    /**
     *  Create child objects of the component.
     *  This is an advanced method that you might override
     *  when creating a subclass of UIComponent.
     *
     *  <p>A component that creates other components or objects within it is called a composite component.
     *  For example, the Flex ComboBox control is actually made up of a TextInput control
     *  to define the text area of the ComboBox, and a Button control to define the ComboBox arrow.
     *  Components implement the <code>createChildren()</code> method to create child
     *  objects (such as other components) within the component.</p>
     *
     *  <p>From within an override of the <code>createChildren()</code> method,
     *  you call the <code>addChild()</code> method to add each child object. </p>
     *
     *  <p>You do not call this method directly. Flex calls the
     *  <code>createChildren()</code> method in response to the call to
     *  the <code>addChild()</code> method to add the component to its parent. </p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function createChildren():void
    {
        if (goog.DEBUG)
            trace("createChildren not implemented");
    }
    

    //--------------------------------------------------------------------------
    //
    //  Methods: Invalidation
    //
    //--------------------------------------------------------------------------

    /**
     *  Marks a component so that its <code>commitProperties()</code>
     *  method gets called during a later screen update.
     *
     *  <p>Invalidation is a useful mechanism for eliminating duplicate
     *  work by delaying processing of changes to a component until a
     *  later screen update.
     *  For example, if you want to change the text color and size,
     *  it would be wasteful to update the color immediately after you
     *  change it and then update the size when it gets set.
     *  It is more efficient to change both properties and then render
     *  the text with its new size and color once.</p>
     *
     *  <p>Invalidation methods rarely get called.
     *  In general, setting a property on a component automatically
     *  calls the appropriate invalidation method.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function invalidateProperties():void
    {
    }

    /**
     *  Marks a component so that its <code>measure()</code>
     *  method gets called during a later screen update.
     *
     *  <p>Invalidation is a useful mechanism for eliminating duplicate
     *  work by delaying processing of changes to a component until a
     *  later screen update.
     *  For example, if you want to change the text and font size,
     *  it would be wasteful to update the text immediately after you
     *  change it and then update the size when it gets set.
     *  It is more efficient to change both properties and then render
     *  the text with its new size once.</p>
     *
     *  <p>Invalidation methods rarely get called.
     *  In general, setting a property on a component automatically
     *  calls the appropriate invalidation method.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function invalidateSize():void
    {
    }

    /**
     *  Helper method to invalidate parent size and display list if
     *  this object affects its layout (includeInLayout is true).
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function invalidateParentSizeAndDisplayList():void
    {
    }

    /**
     *  Marks a component so that its <code>updateDisplayList()</code>
     *  method gets called during a later screen update.
     *
     *  <p>Invalidation is a useful mechanism for eliminating duplicate
     *  work by delaying processing of changes to a component until a
     *  later screen update.
     *  For example, if you want to change the width and height,
     *  it would be wasteful to update the component immediately after you
     *  change the width and then update again with the new height.
     *  It is more efficient to change both properties and then render
     *  the component with its new size once.</p>
     *
     *  <p>Invalidation methods rarely get called.
     *  In general, setting a property on a component automatically
     *  calls the appropriate invalidation method.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function invalidateDisplayList():void
    {
    }

    /**
     *  Detects changes to style properties. When any style property is set,
     *  Flex calls the <code>styleChanged()</code> method,
     *  passing to it the name of the style being set.
     *
     *  <p>This is an advanced method that you might override
     *  when creating a subclass of UIComponent. When you create a custom component,
     *  you can override the <code>styleChanged()</code> method
     *  to check the style name passed to it, and handle the change accordingly.
     *  This lets you override the default behavior of an existing style,
     *  or add your own custom style properties.</p>
     *
     *  <p>If you handle the style property, your override of
     *  the <code>styleChanged()</code> method should call the
     *  <code>invalidateDisplayList()</code> method to cause Flex to execute
     *  the component's <code>updateDisplayList()</code> method at the next screen update.</p>
     *
     *  @param styleProp The name of the style property, or null if all styles for this
     *  component have changed.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function styleChanged(styleProp:String):void
    {
        if (goog.DEBUG)
            trace("styleChanged not implemented");
    }

    /**
     *  Validate and update the properties and layout of this object
     *  and redraw it, if necessary.
     *
     *  Processing properties that require substantial computation are normally
     *  not processed until the script finishes executing.
     *  For example setting the <code>width</code> property is delayed, because it can
     *  require recalculating the widths of the objects children or its parent.
     *  Delaying the processing prevents it from being repeated
     *  multiple times if the script sets the <code>width</code> property more than once.
     *  This method lets you manually override this behavior.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function validateNow():void
    {
    }


    /**
     *  Queues a function to be called later.
     *
     *  <p>Before each update of the screen, Flash Player or AIR calls
     *  the set of functions that are scheduled for the update.
     *  Sometimes, a function should be called in the next update
     *  to allow the rest of the code scheduled for the current
     *  update to be executed.
     *  Some features, like effects, can cause queued functions to be
     *  delayed until the feature completes.</p>
     *
     *  @param method Reference to a method to be executed later.
     *
     *  @param args Array of Objects that represent the arguments to pass to the method.
     *
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function callLater(method:Function,
                              args:Array /* of Object */ = null):void
    {
        if (goog.DEBUG)
            trace("callLater not implemented");

    }


    //--------------------------------------------------------------------------
    //
    //  Methods: Commitment
    //
    //--------------------------------------------------------------------------

    /**
     *  Used by layout logic to validate the properties of a component
     *  by calling the <code>commitProperties()</code> method.
     *  In general, subclassers should
     *  override the <code>commitProperties()</code> method and not this method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function validateProperties():void
    {
        if (goog.DEBUG)
            trace("validateProperties not implemented");
    }

    /**
     *  Processes the properties set on the component.
     *  This is an advanced method that you might override
     *  when creating a subclass of UIComponent.
     *
     *  <p>You do not call this method directly.
     *  Flex calls the <code>commitProperties()</code> method when you
     *  use the <code>addChild()</code> method to add a component to a container,
     *  or when you call the <code>invalidateProperties()</code> method of the component.
     *  Calls to the <code>commitProperties()</code> method occur before calls to the
     *  <code>measure()</code> method. This lets you set property values that might
     *  be used by the <code>measure()</code> method.</p>
     *
     *  <p>Some components have properties that affect the number or kinds
     *  of child objects that they need to create, or have properties that
     *  interact with each other, such as the <code>horizontalScrollPolicy</code>
     *  and <code>horizontalScrollPosition</code> properties.
     *  It is often best at startup time to process all of these
     *  properties at one time to avoid duplicating work.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function commitProperties():void
    {
        if (goog.DEBUG)
            trace("commitProperties not implemented");
    }

    //--------------------------------------------------------------------------
    //
    //  Methods: Measurement
    //
    //--------------------------------------------------------------------------

    /**
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function validateSize(recursive:Boolean = false):void
    {
        if (goog.DEBUG)
            trace("validateSize not implemented");
    }

    /**
     *  Calculates the default size, and optionally the default minimum size,
     *  of the component. This is an advanced method that you might override when
     *  creating a subclass of UIComponent.
     *
     *  <p>You do not call this method directly. Flex calls the
     *  <code>measure()</code> method when the component is added to a container
     *  using the <code>addChild()</code> method, and when the component's
     *  <code>invalidateSize()</code> method is called. </p>
     *
     *  <p>When you set a specific height and width of a component,
     *  Flex does not call the <code>measure()</code> method,
     *  even if you explicitly call the <code>invalidateSize()</code> method.
     *  That is, Flex only calls the <code>measure()</code> method if
     *  the <code>explicitWidth</code> property or the <code>explicitHeight</code>
     *  property of the component is NaN. </p>
     *
     *  <p>In your override of this method, you must set the
     *  <code>measuredWidth</code> and <code>measuredHeight</code> properties
     *  to define the default size.
     *  You can optionally set the <code>measuredMinWidth</code> and
     *  <code>measuredMinHeight</code> properties to define the default
     *  minimum size.</p>
     *
     *  <p>Most components calculate these values based on the content they are
     *  displaying, and from the properties that affect content display.
     *  A few components simply have hard-coded default values. </p>
     *
     *  <p>The conceptual point of <code>measure()</code> is for the component to provide
     *  its own natural or intrinsic size as a default. Therefore, the
     *  <code>measuredWidth</code> and <code>measuredHeight</code> properties
     *  should be determined by factors such as:</p>
     *  <ul>
     *     <li>The amount of text the component needs to display.</li>
     *     <li>The styles, such as <code>fontSize</code>, for that text.</li>
     *     <li>The size of a JPEG image that the component displays.</li>
     *     <li>The measured or explicit sizes of the component's children.</li>
     *     <li>Any borders, margins, and gaps.</li>
     *  </ul>
     *
     *  <p>In some cases, there is no intrinsic way to determine default values.
     *  For example, a simple GreenCircle component might simply set
     *  measuredWidth = 100 and measuredHeight = 100 in its <code>measure()</code> method to
     *  provide a reasonable default size. In other cases, such as a TextArea,
     *  an appropriate computation (such as finding the right width and height
     *  that would just display all the text and have the aspect ratio of a Golden Rectangle)
     *  might be too time-consuming to be worthwhile.</p>
     *
     *  <p>The default implementation of <code>measure()</code>
     *  sets <code>measuredWidth</code>, <code>measuredHeight</code>,
     *  <code>measuredMinWidth</code>, and <code>measuredMinHeight</code>
     *  to <code>0</code>.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function measure():void
    {
        measuredMinWidth = 0;
        measuredMinHeight = 0;
        measuredWidth = 0;
        measuredHeight = 0;
    }


    /**
     *  A convenience method for determining whether to use the
     *  explicit or measured width
     *
     *  @return A Number which is explicitWidth if defined
     *  or measuredWidth if not.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function getExplicitOrMeasuredWidth():Number
    {
        return !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
    }

    /**
     *  A convenience method for determining whether to use the
     *  explicit or measured height
     *
     *  @return A Number which is explicitHeight if defined
     *  or measuredHeight if not.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function getExplicitOrMeasuredHeight():Number
    {
        return !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
    }

    /**
     *  A convenience method for determining the unscaled width
     *  of the component
     *  All of a component's drawing and child layout should be done
     *  within a bounding rectangle of this width, which is also passed
     *  as an argument to <code>updateDisplayList()</code>.
     *
     *  @return A Number which is unscaled width of the component.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function get unscaledWidth():Number
    {
        return width;
    }


    /**
     *  A convenience method for determining the unscaled height
     *  of the component.
     *  All of a component's drawing and child layout should be done
     *  within a bounding rectangle of this height, which is also passed
     *  as an argument to <code>updateDisplayList()</code>.
     *
     *  @return A Number which is unscaled height of the component.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function get unscaledHeight():Number
    {
        return height;
    }


    /**
     *  Measures the specified text, assuming that it is displayed
     *  in a single-line UITextField (or UIFTETextField) using a UITextFormat
     *  determined by the styles of this UIComponent.  Does not 
     *  work for Spark components since they don't use UITextField
     *  (or UIFTETextField).  To measure text in Spark components, 
     *  get the measurements of a spark.components.Label 
     *  or spark.components.RichText
     *
     *  @param text A String specifying the text to measure.
     *
     *  @return A TextLineMetrics object containing the text measurements.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function measureText(text:String):TextLineMetrics
    {
        if (goog.DEBUG)
            trace("measureText not implemented");
    }

    //--------------------------------------------------------------------------
    //
    //  Methods: Drawing and Child Layout
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    private var lastUnscaledWidth:Number;
    /**
     *  @private
     */
    private var lastUnscaledHeight:Number;


    /**
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function validateDisplayList():void
    {
        if (goog.DEBUG)
            trace("validateDisplayList not implemented");                    
    }

    /**
     *  Draws the object and/or sizes and positions its children.
     *  This is an advanced method that you might override
     *  when creating a subclass of UIComponent.
     *
     *  <p>You do not call this method directly. Flex calls the
     *  <code>updateDisplayList()</code> method when the component is added to a container
     *  using the <code>addChild()</code> method, and when the component's
     *  <code>invalidateDisplayList()</code> method is called. </p>
     *
     *  <p>If the component has no children, this method
     *  is where you would do programmatic drawing
     *  using methods on the component's Graphics object
     *  such as <code>graphics.drawRect()</code>.</p>
     *
     *  <p>If the component has children, this method is where
     *  you would call the <code>move()</code> and <code>setActualSize()</code>
     *  methods on its children.</p>
     *
     *  <p>Components can do programmatic drawing even if
     *  they have children. In doing either, use the
     *  component's <code>unscaledWidth</code> and <code>unscaledHeight</code>
     *  as its bounds.</p>
     *
     *  <p>It is important to use <code>unscaledWidth</code> and
     *  <code>unscaledHeight</code> instead of the <code>width</code>
     *  and <code>height</code> properties.</p>
     *
     *  @param unscaledWidth Specifies the width of the component, in pixels,
     *  in the component's coordinates, regardless of the value of the
     *  <code>scaleX</code> property of the component.
     *
     *  @param unscaledHeight Specifies the height of the component, in pixels,
     *  in the component's coordinates, regardless of the value of the
     *  <code>scaleY</code> property of the component.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function updateDisplayList(unscaledWidth:Number,
                                        unscaledHeight:Number):void
    {
        if (goog.DEBUG)
            trace("updateDisplayList not implemented");                    
    }

    
    [Inspectable(category="General")]

    /**
     *  <p>For components, this layout constraint property is a
     *  facade on top of the similarly-named style. To set
     *  a state-specific value of the property in MXML to its default 
     *  value of <code>undefined</code>,
     *  use the &#64;Clear() directive. For example, in MXML code,
     *  <code>left.s2="&#64;Clear()"</code> unsets the <code>left</code>
     *  constraint in state s2. Or in ActionScript code, 
     *  <code>button.left = undefined</code> unsets the <code>left</code>
     *  constraint on <code>button</code>.</p>
     * 
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get left():Object
    {
        if (goog.DEBUG)
            trace("left not implemented");
        return 0;
    }
    public function set left(value:Object):void
    {
        if (goog.DEBUG)
            trace("left not implemented");
    }

    [Inspectable(category="General")]

    /**
     *  <p>For components, this layout constraint property is a
     *  facade on top of the similarly-named style. To set
     *  the property to its default value of <code>undefined</code>,
     *  use the &#64;Clear() directive in MXML or the <code>undefined</code>
     *  value in ActionScript code. For example, in MXML code,
     *  <code>right.s2="&#64;Clear()"</code> unsets the <code>right</code>
     *  constraint in state s2. Or in ActionScript code, 
     *  <code>button.right = undefined</code> unsets the <code>right</code>
     *  constraint on <code>button</code>.</p>
     *  
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get right():Object
    {
        if (goog.DEBUG)
            trace("right not implemented");
        return 0;
    }
    public function set right(value:Object):void
    {
        if (goog.DEBUG)
            trace("right not implemented");
    }

    [Inspectable(category="General")]

    /**
     *  <p>For components, this layout constraint property is a
     *  facade on top of the similarly-named style. To set
     *  the property to its default value of <code>undefined</code>,
     *  use the &#64;Clear() directive in MXML or the <code>undefined</code>
     *  value in ActionScript code. For example, in MXML code,
     *  <code>top.s2="&#64;Clear()"</code> unsets the <code>top</code>
     *  constraint in state s2. Or in ActionScript code, 
     *  <code>button.top = undefined</code> unsets the <code>top</code>
     *  constraint on <code>button</code>.</p>
     *  
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get top():Object
    {
        if (goog.DEBUG)
            trace("top not implemented");
        return 0;
    }
    public function set top(value:Object):void
    {
        if (goog.DEBUG)
            trace("top not implemented");
    }

    [Inspectable(category="General")]

    /**
     *  <p>For components, this layout constraint property is a
     *  facade on top of the similarly-named style. To set
     *  the property to its default value of <code>undefined</code>,
     *  use the &#64;Clear() directive in MXML or the <code>undefined</code>
     *  value in ActionScript code. For example, in MXML code,
     *  <code>bottom.s2="&#64;Clear()"</code> unsets the <code>bottom</code>
     *  constraint in state s2. Or in ActionScript code, 
     *  <code>button.bottom = undefined</code> unsets the <code>bottom</code>
     *  constraint on <code>button</code>.</p>
     *  
     *  @inheritDoc
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get bottom():Object
    {
        if (goog.DEBUG)
            trace("bottom not implemented");
        return 0;
    }
    public function set bottom(value:Object):void
    {
        if (goog.DEBUG)
            trace("bottom not implemented");
    }

    [Inspectable(category="General")]


    //--------------------------------------------------------------------------
    //
    //  Methods: Moving and sizing
    //
    //--------------------------------------------------------------------------

     /**
      *  Moves the component to a specified position within its parent.
      *  Calling this method is exactly the same as
      *  setting the component's <code>x</code> and <code>y</code> properties.
      *
      *  <p>If you are overriding the <code>updateDisplayList()</code> method
      *  in a custom component, call the <code>move()</code> method
      *  rather than setting the <code>x</code> and <code>y</code> properties.
      *  The difference is that the <code>move()</code> method changes the location
      *  of the component and then dispatches a <code>move</code> event when you
      *  call the method, while setting the <code>x</code> and <code>y</code>
      *  properties changes the location of the component and dispatches
      *  the event on the next screen refresh.</p>
      *
      *  @param x Left position of the component within its parent.
      *
      *  @param y Top position of the component within its parent.
      *  
      *  @langversion 3.0
      *  @playerversion Flash 9
      *  @playerversion AIR 1.1
      *  @productversion Flex 3
      */
    public function move(x:Number, y:Number):void
    {
        if (goog.DEBUG)
            trace("move not implemented");
    }

    /**
     *  Sizes the object.
     *  Unlike directly setting the <code>width</code> and <code>height</code>
     *  properties, calling the <code>setActualSize()</code> method
     *  does not set the <code>explictWidth</code> and
     *  <code>explicitHeight</code> properties, so a future layout
     *  calculation can result in the object returning to its previous size.
     *  This method is used primarily by component developers implementing
     *  the <code>updateDisplayList()</code> method, by Effects,
     *  and by the LayoutManager.
     *
     *  @param w Width of the object.
     *
     *  @param h Height of the object.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function setActualSize(w:Number, h:Number):void
    {
        if (goog.DEBUG)
            trace("setActualSize not implemented");
    }


    /**
     *  Sets the focus to this component.
     *  The component can in turn pass focus to a subcomponent.
     *
     *  <p><b>Note:</b> Only the TextInput and TextArea controls show a highlight
     *  when this method sets the focus.
     *  All controls show a highlight when the user tabs to the control.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function setFocus():void
    {
        if (goog.DEBUG)
            trace("setFocus not implemented");
    }


    [Bindable(style="true")]
    /**
     *  Gets a style property that has been set anywhere in this
     *  component's style lookup chain.
     *
     *  <p>This same method is used to get any kind of style property,
     *  so the value returned can be a Boolean, String, Number, int,
     *  uint (for an RGB color), Class (for a skin), or any kind of object.
     *  Therefore the return type is simply specified as ~~.</p>
     *
     *  <p>If you are getting a particular style property, you 
     *  know its type and often want to store the result in a
     *  variable of that type.
     *  No casting from ~~ to that type is necessary.</p>
     *
     *  <p>
     *  <code>
     *  var backgroundColor:uint = getStyle("backgroundColor");
     *  </code>
     *  </p>
     *
     *  <p>If the style property has not been set anywhere in the
     *  style lookup chain, the value returned by <code>getStyle()</code>
     *  is <code>undefined</code>.
     *  Note that <code>undefined</code> is a special value that is
     *  not the same as <code>false</code>, <code>""</code>,
     *  <code>NaN</code>, <code>0</code>, or <code>null</code>.
     *  No valid style value is ever <code>undefined</code>.
     *  You can use the method
     *  <code>IStyleManager2.isValidStyleValue()</code>
     *  to test whether the value was set.</p>
     *
     *  @param styleProp Name of the style property.
     *
     *  @return Style value.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function getStyle(styleProp:String):*
    {
        if (goog.DEBUG)
            trace("getStyle not implemented");
        return 0;

    }

    /**
     *  Sets a style property on this component instance.
     *
     *  <p>This can override a style that was set globally.</p>
     *
     *  <p>Calling the <code>setStyle()</code> method can result in decreased performance.
     *  Use it only when necessary.</p>
     *
     *  @param styleProp Name of the style property.
     *
     *  @param newValue New value for the style.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function setStyle(styleProp:String, newValue:*):void
    {
        if (goog.DEBUG)
            trace("setStyle not implemented");
    }



    //--------------------------------------------------------------------------
    //
    //  Event handlers: Keyboard
    //
    //--------------------------------------------------------------------------

    /**
     *  The event handler called for a <code>keyDown</code> event.
     *  If you override this method, make sure to call the base class version.
     *
     *  @param event The event object.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function keyDownHandler(event:KeyboardEvent):void
    {
        // You must override this function if your component accepts focus
    }

    /**
     *  The event handler called for a <code>keyUp</code> event.
     *  If you override this method, make sure to call the base class version.
     *
     *  @param event The event object.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    protected function keyUpHandler(event:KeyboardEvent):void
    {
        // You must override this function if your component accepts focus
    }


    //--------------------------------------------------------------------------
    //
    //  IUIComponent
    //
    //--------------------------------------------------------------------------

    /**
     *  Returns <code>true</code> if the chain of <code>owner</code> properties
     *  points from <code>child</code> to this UIComponent.
     *
     *  @param child A UIComponent.
     *
     *  @return <code>true</code> if the child is parented or owned by this UIComponent.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function owns(child:IUIComponent):Boolean
    {
        if (goog.DEBUG)
            trace("owns not implemented");
        return true;
    }


}

}

////////////////////////////////////////////////////////////////////////////////
//
//  Helper class: MethodQueueElement
//
////////////////////////////////////////////////////////////////////////////////

/**
 *  @private
 *  An element of the methodQueue array.
 */
class MethodQueueElement
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function MethodQueueElement(method:Function,
                                       args:Array /* of Object */ = null)
    {
        super();

        this.method = method;
        this.args = args;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  method
    //----------------------------------

    /**
     *  A reference to the method to be called.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public var method:Function;

    //----------------------------------
    //  args
    //----------------------------------

    /**
     *  The arguments to be passed to the method.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public var args:Array /* of Object */;
}