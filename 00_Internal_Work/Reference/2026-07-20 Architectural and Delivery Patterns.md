To select the right strategy, evaluate your project along three main vectors: **Technical Ambiguity**, **Market Ambiguity**, and **Team/System Complexity**.

### Strategy Selection Framework

```plaintext
                   ```
                   [ Is Technical / Integration Risk High? ]
                               /              \
                            YES                NO
                           /                    \
 [ Is Infrastructure Known? ]             [ Is UX / Market Fit Known? ]
      /                 \                       /              \
    YES                  NO                   YES               NO
    /                     \                   /                  \

```

WALKING SKELETON        TRACER BULLET      VERTICAL SLICE      PROTOTYPE / SPIKE

```plaintext

### Decision Matrix

**Project Context**

**Recommended Approach**

**Primary Objective**

**New cloud platform, complex microservices, unknown deployment pipeline**

**Walking Skeleton**

Prove CI/CD, networking, auth, and database integration before writing business logic.

**New algorithm, unfamiliar technology, performance benchmark unproven**

**Tracer Bullet**

Fire a fast, end-to-end spike to gather real runtime data and validate technical feasibility.

**Well-understood architecture, established stack, clear product backlog**

**Vertical Slice**

Deliver fully functional business features sequentially to provide early user value.

**Unclear user workflows, startup hypothesis testing, UI/UX validation**

**Throwaway Prototype**

Test user behavior and gather feedback with zero infrastructure overhead.

### When to Combine Approaches

In complex real-world builds, these approaches often run in sequence:

1.  **Spike / Prototype:** Run a 2-day spike to test an unfamiliar third-party API or mock UI for user testing.
    
2.  **Walking Skeleton:** Build a thin end-to-end connection (UI $\\rightarrow$ API $\\rightarrow$ DB) deployed to production.
    
3.  **Vertical Slices:** Begin building complete user-facing features on top of the skeleton, one slice at a time.
```
