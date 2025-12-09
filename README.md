# Simple Machines in Godot 4

This guide explains how to build two simple machines in the Godot 4 Editor: a Class 1 lever (see-saw) and an inclined plane with adjustable friction. Follow the scene tree layouts and property tips to assemble them quickly.

## Class 1 Lever (See-Saw)

**Scene Tree**

```
LeverRoot (Node2D)
├── Base (StaticBody2D)
│   └── BaseCollision (CollisionShape2D)
├── Bar (RigidBody2D)
│   └── BarCollision (CollisionShape2D)
└── Pivot (PinJoint2D)
```

**Setup Steps**

1. **Base**
   - Add a **StaticBody2D** for the fulcrum and give it a **CollisionShape2D** sized like the support.
   - Place it at the world position where you want the lever to pivot.

2. **Bar**
   - Add a **RigidBody2D** for the plank and add a rectangular (or capsule) **CollisionShape2D** that spans the see-saw length.
   - Keep `RigidBody2D` mode set to **Rigid** so physics can rotate the bar naturally.

3. **PinJoint2D**
   - Add a **PinJoint2D** as a sibling of the two bodies.
   - Set **Node A** to the `Base` path and **Node B** to the `Bar` path.
   - Align the joint’s position with the fulcrum (usually the center of the base). The joint locks both bodies at that point while still allowing the bar to rotate freely.
   - Optional: adjust `Bias` (stability) and `Softness` (springiness) on the joint to tune how quickly the bar responds and settles.

When you press Play, the bar will rotate around the base like a real see-saw, and other physics bodies can land on it and tip the balance.

## Inclined Plane with Adjustable Friction

**Scene Tree**

```
InclineRoot (Node2D)
└── Ramp (StaticBody2D)
    └── RampCollision (CollisionShape2D)
```

**Setup Steps**

1. Add a **StaticBody2D** named `Ramp` and give it a **CollisionShape2D** that matches your slope (e.g., a rotated rectangle or polygon).
2. Create a new **PhysicsMaterial** and assign it to the `Ramp`’s **Material Override**.
3. Tweak `Friction` on the material:
   - Higher values (e.g., `1.0` and above) increase traction so objects slide slowly or stick.
   - Lower values (e.g., `0.1` or `0`) reduce grip so objects slide faster.
4. Optionally adjust `Bounce` on the same material if you want objects to rebound when they hit the ramp.

Changing the `Friction` value on the `PhysicsMaterial` lets you fine-tune how quickly objects move down the incline without altering the scene layout.
