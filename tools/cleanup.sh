#!/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at http://smartos.org/CDDL
#
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file.
#
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2018, Joyent, Inc.
#
# Summary:
#
#    Run this tool to cleanup from failed builds.
#

# Umount mounts that were left behind.
for i in $(mount | grep zoneproto | grep root | cut -d ' ' -f1); do
    umount ${i}
done

# Destroy datasets that were left behind.
for i in $(zfs list -t all | grep zoneproto | cut -d ' ' -f1); do
    zfs destroy ${i}
done
