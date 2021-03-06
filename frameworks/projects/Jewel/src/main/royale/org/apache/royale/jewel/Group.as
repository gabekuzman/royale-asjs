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
package org.apache.royale.jewel
{
    import org.apache.royale.core.IMXMLDocument;
    import org.apache.royale.core.ValuesManager;
    import org.apache.royale.events.Event;
    import org.apache.royale.jewel.beads.layouts.StyledLayoutBase;
    import org.apache.royale.jewel.supportClasses.group.GroupBase;
    import org.apache.royale.utils.MXMLDataInterpreter;
    import org.apache.royale.utils.StringUtil;

    /**
	 *  Indicates that the children of the container is have been added.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.8
	 */
	[Event(name="childrenAdded", type="org.apache.royale.events.Event")]
	
	/**
	 * The default property uses when additional MXML content appears within an element's
	 * definition in an MXML file.
	 */
	[DefaultProperty("mxmlContent")]

    /**
     *  The Jewel Group class provides a light-weight container for visual elements. By default
	 *  the Group does not have a layout, allowing its children to be sized and positioned
	 *  using styles or CSS.
     *
     *  @toplevel
     *  @see org.apache.royale.jewel.beads.layout
     *  @see org.apache.royale.jewel.supportClasses.jewel.ScrollingViewport
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.9.4
     */
	public class Group extends GroupBase implements IMXMLDocument
	{
        /**
         *  Constructor.
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.4
         */
		public function Group()
		{
			super();
            typeNames = "";
		}

        private var _mxmlDescriptor:Array;
		private var _mxmlDocument:Object = this;
		private var _initialized:Boolean;
		
		/**
		 * @private
		 */
		override public function addedToParent():void
		{
			if (!_initialized)
			{
				// each MXML file can also have styles in fx:Style block
				ValuesManager.valuesImpl.init(this);
			}
			
			super.addedToParent();
			
			if (!_initialized)
			{
				MXMLDataInterpreter.generateMXMLInstances(_mxmlDocument, this, MXMLDescriptor);
				
				dispatchEvent(new Event("initBindings"));
				dispatchEvent(new Event("initComplete"));
				_initialized = true;
				
				//?? why was this added here? childrenAdded(); //?? Is this needed since MXMLDataInterpreter will already have called it
			}
		}
		
		/**
		 *  @copy org.apache.royale.core.Application#MXMLDescriptor
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.8
		 */
		public function get MXMLDescriptor():Array
		{
			return _mxmlDescriptor;
		}
		
		/**
		 *  @private
		 */
		public function setMXMLDescriptor(document:Object, value:Array):void
		{
			_mxmlDocument = document;
			_mxmlDescriptor = value;
		}
		
		/**
		 *  @copy org.apache.royale.core.Application#generateMXMLAttributes()
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.8
		 */
		public function generateMXMLAttributes(data:Array):void
		{
			MXMLDataInterpreter.generateMXMLProperties(this, data);
		}
		
		/**
		 *  @copy org.apache.royale.core.ItemRendererClassFactory#mxmlContent
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.8
         * 
         *  @royalesuppresspublicvarwarning
		 */
		public var mxmlContent:Array;

        protected var _layout:StyledLayoutBase;
        
        /**
		 *  Distribute all items horizontally
		 *  Possible values are:
		 *  - itemsLeft
		 *  - itemsCenter
		 *  - itemsRight
		 *  - itemsSpaceBetween
		 *  - itemsSpaceAround
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
        public function get itemsHorizontalAlign():String
        {
            return _layout.itemsHorizontalAlign;
        }

        [Inspectable(category="General", enumeration="itemsLeft,itemsCenter,itemsRight,itemsSpaceBetween,itemsSpaceAround")]
        public function set itemsHorizontalAlign(value:String):void
        {
			typeNames = StringUtil.removeWord(typeNames, " " + _layout.itemsHorizontalAlign);
			_layout.itemsHorizontalAlign = value;
			typeNames += " " + _layout.itemsHorizontalAlign;

			COMPILE::JS
            {
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}
        }

		/**
		 *  Distribute all items vertically
		 *  Possible values are:
		 *  - itemsSameHeight
		 *  - itemsCentered
		 *  - itemsTop
		 *  - itemsBottom
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
        public function get itemsVerticalAlign():String
        {
            return _layout.itemsVerticalAlign;
        }

        [Inspectable(category="General", enumeration="itemsSameHeight,itemsCentered,itemsTop,itemsBottom")]
        public function set itemsVerticalAlign(value:String):void
        {
			typeNames = StringUtil.removeWord(typeNames, " " + _layout.itemsVerticalAlign);
			_layout.itemsVerticalAlign = value;
			typeNames += " " + _layout.itemsVerticalAlign;

			COMPILE::JS
            {
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}
        }

        /**
		 *  A boolean flag to activate "itemsExpand" effect selector.
		 *  Make items resize to the fill all container space
         *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
        public function get itemsExpand():Boolean
        {
            return _layout.itemsExpand;
        }

        public function set itemsExpand(value:Boolean):void
        {
            typeNames = StringUtil.removeWord(typeNames, " itemsExpand");
            _layout.itemsExpand = value;
            if(_layout.itemsExpand)
            {
                typeNames += " itemsExpand";
            }

            COMPILE::JS
            {
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}
        }
	}
}
