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
package jewel.todomvc.vos
{
    [Bindable]
    [RemoteClass(alias="jewel.todomvc.vos.TodoVO")]
    /**
     *  The todo item definition with a label for description an completion state
     *  The remote class is used to save and retrieve from local storage
     */
    public class TodoVO
    {
        /**
         * label description todo
         */
        public var label:String;

        /**
         *  completion state (done/undone)
         */
        public var done:Boolean;
        
        /**
         *  constructor
         */
        public function TodoVO(label:String)
        {
            this.label = label;
        }
    }
}
