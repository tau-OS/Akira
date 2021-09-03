/**
 * Copyright (c) 2019-2021 Alecaddd (https://alecaddd.com)
 *
 * This file is part of Akira.
 *
 * Akira is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * Akira is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with Akira. If not, see <https://www.gnu.org/licenses/>.
 *
 * Authored by: Martin "mbfraga" Fraga <mbfraga@gmail.com>
 */

public class Akira.Lib.Components.Opacity : Component, Copyable<Opacity> {
    private float _opacity;

    public float opacity {
        get { return _opacity; }
    }

    public Opacity (float opacity) {
        if (opacity < 0.0f) {
            _opacity = 0.0f;
            return;
        }

        _opacity = opacity <= 100.0f ? opacity : 100.0f;
    }

    public Opacity.deserialized (Json.Object obj) {
        _opacity = (float) obj.get_double_member ("opacity");
    }

    protected override void serialize_details (ref Json.Object obj) {
        obj.set_double_member ("opacity", (double)_opacity);
    }

    public Opacity copy () {
        return new Opacity (_opacity);
    }
}
