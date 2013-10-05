/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license ( the "Software" ) to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opencl.cl_ext;

import derelict.opencl.loader;
import derelict.opencl.types;

extern (System)
{
    // OpenCL 1.0
    alias nothrow cl_int function(cl_mem, void function(cl_mem, void*), void*) da_clSetMemObjectDestructorAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToSystemLogAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToStdoutAPPLE;
    alias nothrow void function(const(char*), const(void*), size_t, void*) da_clLogMessagesToStderrAPPLE;
    alias nothrow cl_int function(cl_uint, cl_platform_id*, cl_uint*) da_clIcdGetPlatformIDsKHR;
    // OpenCL 1.1
    alias nothrow cl_int function(cl_device_id) da_clReleaseDeviceEXT;
    alias nothrow cl_int function(cl_device_id) da_clRetainDeviceEXT;
    alias nothrow cl_int function(cl_device_id, const(cl_device_partition_property_ext*), cl_uint, cl_device_id*, cl_uint*) da_clCreateSubDevicesEXT;
    // OpenCL 1.2
    alias nothrow cl_int function(cl_context) da_clTerminateContextKHR;
}

__gshared
{
    // OpenCL 1.0
    da_clSetMemObjectDestructorAPPLE clSetMemObjectDestructorAPPLE;
    da_clLogMessagesToSystemLogAPPLE clLogMessagesToSystemLogAPPLE;
    da_clLogMessagesToStdoutAPPLE clLogMessagesToStdoutAPPLE;
    da_clLogMessagesToStderrAPPLE clLogMessagesToStderrAPPLE;
    da_clIcdGetPlatformIDsKHR clIcdGetPlatformIDsKHR;
    // OpenCL 1.1
    da_clReleaseDeviceEXT clReleaseDeviceEXT;
    da_clRetainDeviceEXT clRetainDeviceEXT;
    da_clCreateSubDevicesEXT clCreateSubDevicesEXT;
    // OpenCL 1.2
    da_clTerminateContextKHR clTerminateContextKHR;
}

package
{
    void loadSymbols(void delegate(void**, string, bool doThrow) bindFunc)
    {

    }

    CLVersion reload(void delegate(void**, string, bool doThrow) bindFunc, CLVersion clVer)
    {
        return clVer;
    }

    private __gshared bool _EXT_cl_APPLE_SetMemObjectDestructor;
    public bool EXT_cl_APPLE_SetMemObjectDestructor() @property { return _EXT_cl_APPLE_SetMemObjectDestructor; }
    private void load_cl_APPLE_SetMemObjectDestructor()
    {
        try
        {
            loadExtensionFunction(cast(void**)&clSetMemObjectDestructorAPPLE, "clSetMemObjectDestructorAPPLE");

            _EXT_cl_APPLE_SetMemObjectDestructor = clSetMemObjectDestructorAPPLE !is null;
        }
        catch(Exception e)
        {
            _EXT_cl_APPLE_SetMemObjectDestructor = false;
        }
    }

    private __gshared bool _EXT_cl_APPLE_ContextLoggingFunctions;
    public bool EXT_cl_APPLE_ContextLoggingFunctions() @property { return _EXT_cl_APPLE_ContextLoggingFunctions; }
    private void load_cl_APPLE_ContextLoggingFunctions()
    {
        try
        {
            loadExtensionFunction(cast(void**)&clLogMessagesToSystemLogAPPLE, "clLogMessagesToSystemLogAPPLE");
            loadExtensionFunction(cast(void**)&clLogMessagesToStdoutAPPLE, "clLogMessagesToStdoutAPPLE");
            loadExtensionFunction(cast(void**)&clLogMessagesToStderrAPPLE, "clLogMessagesToStderrAPPLE");

            _EXT_cl_APPLE_ContextLoggingFunctions = clLogMessagesToSystemLogAPPLE !is null &&
                                                    clLogMessagesToStdoutAPPLE !is null &&
                                                    clLogMessagesToStderrAPPLE !is null;
        }
        catch(Exception e)
        {
            _EXT_cl_APPLE_ContextLoggingFunctions = false;
        }
    }

    private __gshared bool _EXT_cl_khr_icd;
    public bool EXT_cl_khr_icd() @property { return _EXT_cl_khr_icd; }
    private void load_cl_khr_icd()
    {
        try
        {
            loadExtensionFunction(cast(void**)&clIcdGetPlatformIDsKHR, "clIcdGetPlatformIDsKHR");

            _EXT_cl_khr_icd = clIcdGetPlatformIDsKHR !is null;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_icd = false;
        }
    }

    private __gshared bool _EXT_cl_ext_device_fission;
    public bool EXT_cl_ext_device_fission() @property { return _EXT_cl_ext_device_fission; }
    private void load_cl_ext_device_fission()
    {
        try
        {
            loadExtensionFunction(cast(void**)&clReleaseDeviceEXT, "clReleaseDeviceEXT");
            loadExtensionFunction(cast(void**)&clRetainDeviceEXT, "clRetainDeviceEXT");
            loadExtensionFunction(cast(void**)&clCreateSubDevicesEXT, "clCreateSubDevicesEXT");

            _EXT_cl_ext_device_fission = clReleaseDeviceEXT !is null &&
                                         clRetainDeviceEXT !is null &&
                                         clCreateSubDevicesEXT !is null;
        }
        catch(Exception e)
        {
            _EXT_cl_ext_device_fission = false;
        }
    }

    private __gshared bool _EXT_cl_khr_terminate_context;
    public bool EXT_cl_khr_terminate_context() @property { return _EXT_cl_khr_terminate_context; }
    private void load_cl_khr_terminate_context()
    {
        try
        {
            loadExtensionFunction(cast(void**)&clTerminateContextKHR, "clTerminateContextKHR");

            _EXT_cl_khr_terminate_context = clTerminateContextKHR !is null;
        }
        catch(Exception e)
        {
            _EXT_cl_khr_terminate_context = false;
        }
    }


    void loadEXT( CLVersion clVer)
    {
        if(clVer >= CLVersion.CL10)
        {
            // OpenCL 1.0
            load_cl_APPLE_SetMemObjectDestructor();
            load_cl_APPLE_ContextLoggingFunctions();
            load_cl_khr_icd();
        }

        if(clVer >= CLVersion.CL11)
        {
            // OpenCL 1.1
            load_cl_ext_device_fission();
        }

        if(clVer >= CLVersion.CL12)
        {
            // OpenCL 1.2
            load_cl_khr_terminate_context();
        }
    }
}