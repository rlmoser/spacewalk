--
-- Copyright (c) 2008--2012 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--


CREATE TABLE rhnActionKickstart
(
    id                  NUMBER NOT NULL,
    action_id           NUMBER NOT NULL
                            CONSTRAINT rhn_actionks_aid_fk
                                REFERENCES rhnAction (id)
                                ON DELETE CASCADE,
    append_string       VARCHAR2(1024),
    kickstart_host      VARCHAR2(256),
    static_device       VARCHAR2(32),
    cobbler_system_name VARCHAR2(256),
    created             timestamp with local time zone
                            DEFAULT (current_timestamp) NOT NULL,
    modified            timestamp with local time zone
                            DEFAULT (current_timestamp) NOT NULL
)
ENABLE ROW MOVEMENT
;

CREATE UNIQUE INDEX rhn_actionks_aid_uq
    ON rhnActionKickstart (action_id)
    TABLESPACE [[8m_tbs]];

CREATE INDEX rhn_actionks_id_idx
    ON rhnActionKickstart (id)
    TABLESPACE [[4m_tbs]];

CREATE SEQUENCE rhn_actionks_id_seq;

ALTER TABLE rhnActionKickstart
    ADD CONSTRAINT rhn_actionks_id_pk PRIMARY KEY (id);

