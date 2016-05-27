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
package org.apache.flex.charts.core
{
	import org.apache.flex.core.graphics.IFill;
	import org.apache.flex.core.graphics.IStroke;
	import org.apache.flex.core.IVisualElement;

	/**
	 * The IAxisGroup defines the interface for classes that provide drawing
	 * space for chart axis objects, such as tick marks and lines.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public interface IAxisGroup extends IVisualElement
	{
		function removeAllElements():void;
		
		function drawHorizontalTickLabel( text:String, xpos:Number, ypos:Number, boxWidth:Number, boxHeight:Number, fill:IFill ):Object;
		function drawVerticalTickLabel( text:String, xpos:Number, ypos:Number, boxWidth:Number, boxHeight:Number, fill:IFill ):Object;
		function drawTickMarks( originX:Number, originY:Number, width:Number, height:Number, marks:String, tickStroke:IStroke ):void;
		function drawAxisLine( originX:Number, originY:Number, width:Number, height:Number, lineStroke:IStroke ):void;
	}
}