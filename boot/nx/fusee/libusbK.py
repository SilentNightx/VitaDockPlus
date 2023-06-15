# This file is part of Fusée Launcher
# Copyright (C) 2018 Mikaela Szekely <qyriad@gmail.com>
# Copyright (C) 2018 Kate Temkin <k@ktemkin.com>
# Fusée Launcher is licensed under the terms of the GNU GPLv2

from ctypes import *

KLST_HANDLE = c_void_p
KUSB_HANDLE = c_void_p
INVALID_HANDLE_VALUE = -1

class DUMMYSTRUCTNAME(Structure):
	_fields_ = \
	[
		("Offset", c_ulong),
		("OfsettHigh", c_ulong)
	]

class DUMMYUNIONNAME(Union):
	_fields_ = \
	[
		("DUMMYSTRUCTNAME", DUMMYSTRUCTNAME),
		("Pointer", c_void_p)
	]

class OVERLAPPED(Structure):
	_fields_ = \
	[
		("Internal", POINTER(c_ulong)),
		("InternalHigh", POINTER(c_ulong)),
		("DUMMYUNIONNAME", DUMMYUNIONNAME),
		("hEvent", c_void_p)
	]

class KLST_DEV_COMMON_INFO(Structure):
        _fields_ = \
        [
            ("Vid", c_int),
            ("Pid", c_int),
            ("MI", c_int),
            ("InstanceID", c_char * 256)
        ]

class KLST_DEV_INFO(Structure):
    _fields_ = \
[
        ("Common", KLST_DEV_COMMON_INFO),
        ("DriverID", c_int),
        ("DeviceInterfaceGUID", c_char * 256),
        ("DeviceID", c_char * 256),
        ("ClassGUID", c_char * 256),
        ("Mfg", c_char * 256),
        ("DeviceDesc", c_char * 256),
        ("Service", c_char * 256),
        ("SymbolicLink", c_char * 256),
        ("DevicePath", c_char * 256),
        ("LUsb0FilterIndex", c_int),
        ("Connected", c_bool),
        ("KLST_SYNC_FLAG", c_int),
        ("BusNumber", c_int),
        ("DeviceAddress", c_int),
        ("SerialNumber", c_char * 256)
]

class KUSB_DRIVER_API_INFO(Structure):
    _fields_ = \
    [
        ("DriverID", c_int),
        ("FunctionCount", c_int)
    ]

class KUSB_DRIVER_API(Structure):
    _fields_ = \
    [
        ("Info", KUSB_DRIVER_API_INFO),
        ("Init", WINFUNCTYPE(c_bool, KUSB_HANDLE, POINTER(KLST_DEV_INFO))),
        ("Free", c_void_p), # Unused, but pointer sized
        ("ClaimInterface", c_void_p), # Unused, but pointer sized
        ("ReleaseInterface", c_void_p), # Unused, but pointer sized
        ("SetAltInterface", c_void_p), # Unused, but pointer sized
        ("GetAltInterface", c_void_p), # Unused, but pointer sized
        ("GetDescriptor", c_void_p), # Unused, but pointer sized
        ("ControlTransfer", c_void_p), # Unused, but pointer sized
        ("SetPowerPolicy", c_void_p), # Unused, but pointer sized
        ("GetPowerPolicy", c_void_p), # Unused, but pointer sized
        ("SetConfiguration", c_void_p), # Unused, but pointer sized
        ("GetConfiguration", c_void_p), # Unused, but pointer sized
        ("ResetDevice", c_void_p), # Unused, but pointer sized
		("Initialize", c_void_p), # Unused, but pointer sized
		("SelectInterface", c_void_p), # Unused, but pointer sized
		("GetAssociatedInterface", c_void_p), # Unused, but pointer sized
		("Clone", c_void_p), # Unused, but pointer sized
		("QueryInterfaceSettings", c_void_p), # Unused, but pointer sized
		("QueryDeviceInformation", c_void_p), # Unused, but pointer sized
		("SetCurrentAlternateSetting", c_void_p), # Unused, but pointer sized
		("GetCurrentAlternateSetting", c_void_p), # Unused, but pointer sized
		("QueryPipe", c_void_p), # Unused, but pointer sized
		("SetPipePolicy", c_void_p), # Unused, but pointer sized
		("GetPipePolicy", c_void_p), # Unused, but pointer sized

        # BOOL KUSB_API ReadPipe(_in_ KUSB_HANDLE InterfaceHandle, _in_ UCHAR PipeID, _out_ PUCHAR Buffer, _in_ UINT BufferLength, _outopt_ PUINT LengthTransferred, _intopt_ LPOVERLAPPED Overlapped)
		("ReadPipe", WINFUNCTYPE(c_bool, KUSB_HANDLE, c_ubyte, c_void_p, c_uint, POINTER(c_uint), POINTER(OVERLAPPED))),

		# BOOL KUSB_API WritePipe(_in_ KUSB_HANDLE InterfaceHandle, _in_ UCHAR PipeID, _in_ PUCHAR Buffer, _in_ UINT BufferLength, _outopt_ PUINT LengthTransferred, _inopt_ LPOVERLAPPED Overlapped)
		("WritePipe", WINFUNCTYPE(c_bool, KUSB_HANDLE, c_ubyte, POINTER(c_ubyte), c_uint, POINTER(c_uint), POINTER(OVERLAPPED))),

        ("ResetPipe", c_void_p), # Unused, but pointer sized
		("AbortPipe", c_void_p), # Unused, but pointer sized
		("FlushPipe", c_void_p), # Unused, but pointer sized
		("IsoReadPipe", c_void_p), # Unused, but pointer sized
		("IsoWritePipe", c_void_p), # Unused, but pointer sized
		("GetCurrentFrameNumber", c_void_p), # Unused, but pointer sized
		("GetOverlappedResult", c_void_p), # Unused, but pointer sized
		("GetProperty", c_void_p), # Unused, but pointer sized

		# 34: Amount of functions in this struct
		("z_F_i_x_e_d", c_ubyte * (512 - (sizeof(KUSB_DRIVER_API_INFO) - sizeof(POINTER(c_uint)) * 34)))
    ]

class Evt_t(Structure):
    _fields_ = \
    [
        ("Cleanup", c_void_p)
    ]

class Count_t(Structure):
    _fields_ = \
    [
        ("Use", c_ulong),
        ("Ref", c_ulong)
    ]

class User_t(Structure):
    _fields_ = \
    [
        ("Valid", c_int), # BOOL
        ("CleanupCB", c_void_p), # Unused, but pointer sized
        ("Context", c_void_p) # Unused, but pointer sized
    ]

class KOBJ_BASE(Structure):
    _fields_ = \
    [
        ("Disposing", c_ulong),
        ("Evt", Evt_t),
        ("Count", Count_t),
        ("User", User_t)
    ]

class KDEV_HANDLE_INTERNAL(Structure):
    _fields_ = \
    [
        ("Base", KOBJ_BASE),
        ("MasterDeviceHandle", c_void_p),
        ("MasterInterfaceHandle", c_void_p),
        ("DevicePath", c_char_p),
        ("ConfigDescriptor", c_void_p), # Unused, pointer sized
        ("SharedInterfaces", c_void_p),
        ("DriverAPI", POINTER(KUSB_DRIVER_API)),
        ("UsbStack", c_void_p), # Unused, pointer sized
        ("Backend", c_void_p), # Unused, pointer sized
    ]

class Move_t(Structure):
    _fields_ = \
    [
        ("End", c_int),
        ("InterfaceEL", c_void_p), # Unused, pointer sized
        ("AltInterfaceEL", c_void_p), # Unused, pointer sized
        ("PipeEL", c_void_p), # Unused, pointer sized
    ]

class KUSB_HANDLE_INTERNAL(Structure):
    """ What KUSB_HANDLE actually points to """
    _fields_ = \
    [
        ("Base", KOBJ_BASE),
        ("Device", POINTER(KDEV_HANDLE_INTERNAL)),
        ("Selected_SharedInterface_Index", c_long),
        ("IsClone", c_int), # BOOL
        ("Move", Move_t)
    ]

class status_t(Structure):
    _fields_ = \
    [
        ("recipient", c_uint),
        ("index", c_uint),
        ("status", c_uint)
    ]